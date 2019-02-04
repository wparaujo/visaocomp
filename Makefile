default:
	make build
	make run

enter:
	docker exec -ti compvision bash

run:
	docker run --rm -p 8888:8888 -v `pwd`:"/app" -w "/app" --name compvision -it compvision:verao

camera:
	docker run --rm -p 8888:8888 -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`:"/app" -w "/app" -e DISPLAY=${DISPLAY} --name compvision -it --privileged --device=/dev/video0:/dev/video0 compvision:verao

build:
	docker build -t compvision:verao .
