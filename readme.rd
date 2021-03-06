# -*- mode: python ; coding: utf-8 -*-

block_cipher = None


a = Analysis(['manage.py'],
             pathex=['C:\\django'],
             binaries=[],
             datas=[],
             hiddenimports=[
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'django_filters',
    'rest_framework.authtoken',
    'token_jwt',
    'api',
    'core'
    'core/templates',
    'core/static',
    'corsheaders',
    'rest_framework.apps',
    'rest_framework.authtoken.apps',
    'rest_framework.parsers',
    'django.contrib.admin.apps',
    'django.contrib.auth.apps',
    'django.contrib.contenttypes.apps',
    'django.contrib.sessions.apps',
    'django.contrib.messages.apps',
    'django.contrib.staticfiles.apps',
    'django.contrib.messages.middleware',
    'django.contrib.sessions.middleware',
    'django.contrib.sessions.serializers',
    'django.template.loaders',
    'django.contrib.auth.context_processors',
    'django.contrib.messages.context_processors',
    'rest_framework.negotiation',
    'rest_framework.metadata',
    'corsheaders.middleware',
    'django.templatetags.future',
    'django.templatetags.i18n',
    'django.templatetags.l10n',
    'django.contrib.admin.templatetags.log',
    'django.contrib.admin.templatetags.admin_urls',
    'django.contrib.admin.templatetags.admin_modify',
],
    hookspath=[],
    runtime_hooks=[],
    excludes=[],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False)
pyz = PYZ(a.pure, a.zipped_data,
          cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          [],
          name='PriceKey',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=True,
          upx_exclude=[],
          runtime_tmpdir=None,
          console=True)


    'django',
    'captcha' 
    'django.contrib.messages.apps',
    'django.contrib.staticfiles.apps' ,
    'django.contrib.sessions.models',
    'django.contrib.sessions.apps',
    'django.contrib.messages.middleware',
    'django.contrib.sessions.middleware' ,
    'django.contrib.sessions.serializers' ,
    'django.template.loaders',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'django_filters',
    'rest_framework.authtoken',
    'token_jwt',
    'api',
    'api.admin',
    'core'
    'core/templates',
    'core/static',
    'static',
    'templates'
    'corsheaders',
    'loggers_tail',
    'loggers_tail.admin',
    'loggers_tail.templates',
    'loggers_tail/static',
    'loggers_tail.templates.logtail',
    'loggers_tail/static/logtail',
    'rest_framework.apps',
    'rest_framework.authtoken.apps',
    'rest_framework.parsers',
    'django.contrib.admin.apps',
    'django.contrib.auth.apps',
    'django.contrib.contenttypes.apps',
    'django.contrib.sessions.apps',
    'django.contrib.messages.apps',
    'django.contrib.staticfiles.apps',
    'django.contrib.messages.middleware',
    'django.contrib.sessions.middleware',
    'django.contrib.sessions.serializers',
    'django.template.loaders',
    'django.contrib.auth.context_processors',
    'django.contrib.messages.context_processors',
    'rest_framework.negotiation',
    'rest_framework.metadata',
    'corsheaders.middleware',
    'django.templatetags.future',
    'django.templatetags.i18n',
    'django.templatetags.l10n',
    'django.contrib.admin.templatetags.log',
    'django.contrib.admin.templatetags.admin_urls',
    'django.contrib.admin.templatetags.admin_modify',