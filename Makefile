init:
	docker-compose up -d --build
	docker-compose  ps
	docker-compose exec api composer install
	docker-compose exec app php artisan key:generate
	docker-compose exec front npm install
up:
	docker-compose up -d
	docker-compose  ps
build:
	docker-compose build --no-cache --force-rm
down:
	docker-compose down
restart:
	docker-compose restart
	docker-compose  ps
