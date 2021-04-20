from django_filters import rest_framework as filters
from rest_framework import viewsets, mixins
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from token_jwt.authentication import JWTAuthentication
from .models import User, Historico
from .seriallizers import UserSerializer, HistoricoSerializer
from api.services.dict2obj import obj
import requests
import json
from datetime import datetime


def preparaSaida(jsonDados):
    jsonDados = obj(jsonDados)
    saida = dict()
    for x in jsonDados.list:
        data = x.dt_txt.split(' ')
        time = data[1]
        data = datetime.strptime(data[0], "%Y-%m-%d")
        data = str(datetime.strftime(data, "%d/%m/%Y"))
        if data not in saida:
            saida[data] = {"temp": x.main.temp, "time": {}}
        saida[data]['time'][time] = {
            "temp": x.main.temp,
            "min": x.main.temp_min,
            "max": x.main.temp_max,
            "pressure": x.main.pressure,
            "humidity": x.main.humidity,
            "sea_level": x.main.sea_level,
            "wind": x.wind.speed,
            "weather": {
                "main": x.weather[0].main,
                "description": x.weather[0].description,
                "icon": x.weather[0].icon
            },
        }
    return saida


class BuscaPrevisao(viewsets.ModelViewSet):
    def create(self, request, *args, **kwargs):
        dados = obj(request.data)
        CHAVE = "b9e1d7b5ce0e14873b69f59f7facdd3d"
        CIDADE = dados.cidade
        URL = f"http://api.openweathermap.org/data/2.5/forecast?q={CIDADE}&appid={CHAVE}&units=metric&lang=pt_br"

        result = requests.get(URL)
        jsonDados = str(result.json())
        saida = result.json()
        pre = ""
        dataBusca = datetime.now()
        dataBusca = datetime.strftime(dataBusca, '%d/%m/%Y as %H:%M:%S')
        if obj(result.json()).cod == '200':
            Historico(cidade=CIDADE, jsonDados=jsonDados).save()
            pre = {
                "dadosPrevisao": preparaSaida(saida),
                "data": dataBusca,
                "cidade": CIDADE,
            }

        return Response(pre)


class HistoricoViewSet(viewsets.ModelViewSet):
    def list(self, request, *args, **kwargs):
        cidade = request.GET.get('cidade')
        historico = Historico.objects.all()
        if cidade:
            historico = historico.filter(cidade__iexact=cidade)
        dados = list()
        for d in historico:
            jsonDados = d.jsonDados.replace("'", '"')
            dataBusca = datetime.strftime(d.dataBusca, '%d/%m/%Y as %H:%M:%S')
            dados.append({
                "dadosPrevisao": preparaSaida(json.loads(jsonDados)),
                "data": dataBusca,
                "cidade": d.cidade,
            })
        return Response(dados)


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = [IsAuthenticated]
    authentication_classes = [JWTAuthentication]
    filter_backends = (filters.DjangoFilterBackend,)
    filterset_fields = ('id', 'username', 'nivel')
    lookup_field = 'username'

    def create(self, request, *args, **kwargs):
        user_cad = User.objects.create(
            username=request.data['username'], password=request.data['password'], nivel=request.data['nivel'])
        user_cad.save()
        user_cad = User.objects.get(username=request.data['username'])
        user_cad.set_password(request.data['password'])
        user_cad.save()

        data = {
            "username": request.data['username'],
            "nivel": request.data['nivel'],
        }
        return Response(data)

    def partial_update(self, request, *args, **kwargs):
        user_cad = User.objects.filter(username=kwargs['username'])
        user_cad.update(nivel=request.data['nivel'])
        if request.data['password'][0:3] != "pbk":
            user_cad = User.objects.get(username=kwargs['username'])
            user_cad.set_password(request.data['password'])
            user_cad.save()

        data = {
            "username": kwargs['username'],
            "nivel": request.data['nivel'],
        }
        return Response(data)
