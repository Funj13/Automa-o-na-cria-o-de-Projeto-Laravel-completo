@echo off

echo Iniciando script do Projeto Laravel

set /p nome_projeto=Digite o nome do projeto:

echo Criando projeto %nome_projeto% com Laravel na Versão 12...
composer create-project --prefer-dist laravel/laravel %nome_projeto%

echo Projeto %nome_projeto% criado com sucesso!


cd %nome_projeto%


echo Voce respondeu sim. Executando o codigo...
echo Iniciando Instalando do JetStream

composer require laravel/jetstream
php artisan jetstream:install livewire
yes

echo Instalando o Spatie e fazendo sua configurações
composer require spatie/laravel-permission
php artisan vendor:publish --provider="Spatie\Permission\PermissionServiceProvider"

php artisan migrate

php artisan permission:create-permission admin
php artisan permission:create-permission user

echo jetstream instalado com sucesso.
echo Criação do Projeto Finalizada! 