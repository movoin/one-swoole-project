ARGS = $(filter-out $@,$(MAKECMDGOALS))
MAKEFLAGS += --silent

#############################
# Docker machine states
#############################

rebuild:
	docker build -t one/swoole/project $$(pwd)/

up:	clean_runtime run

run:
	docker run -it -d --name one_swoole_project -p 9501:9501 -v $$(pwd):/app one/swoole/project

down:
	docker stop one_swoole_project && docker rm one_swoole_project

start:
	docker start one_swoole_project

stop:
	docker stop one_swoole_project

ssh:
	docker exec -it -u app one_swoole_project bash

root:
	docker exec -it one_swoole_project bash

tail:
	docker logs -f one_swoole_project

clean_ds:
	find . -name .DS_Store -print0 | xargs -0 rm -f

clean_runtime:
	rm -f $$(pwd)/runtime/**/*.log
	rm -f $$(pwd)/runtime/**/*.pid
	rm -f $$(pwd)/runtime/**/*.sock

#############################
# Argument fix workaround
#############################
%:
	@:
