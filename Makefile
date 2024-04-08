build:
	docker-compose build

down:
	docker-compose down --volumes --remove-orphans

run:
	make down && docker-compose up

run-scaled:
	make down && docker-compose up --scale spark-worker=3

run-d:
	make down && docker-compose up -d

stop:
	docker-compose stop

submit:
	docker exec dev-spark-master spark-submit --master spark://spark-master:7077 --deploy-mode client ./apps/$(app)

submit-dev-book:
	make submit app=data_analysis_book/$(app)

rm-results:
	rm -r data/results/*
