WORK_DIR=$(PWD)/wd

# TODO: tun build with params

build:
	./run.sh

clean:
	rm -Rfv $(WORK_DIR)

rm_image:
	docker rmi antik486/centos71

deploy:
	docker push antik486/centos71
