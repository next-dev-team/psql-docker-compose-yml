#Makefile

include ../include.mk

.PHONY: help

help:
	@echo "$(TAG) will build for $(APP_GIT),$(APP_VER)"
	@echo "make config    = build docker env config"
	@echo "make clean     = clean project"

# export
vars := $(filter-out $(VARS_OLD) VARS_OLD,$(.VARIABLES))
export $(.VARIABLES)

config:
ifneq ($(wildcard overwrite.env),"")
	@cat ./docker.vars | /bin/bash ./build-env-docker.sh ./overwrite.env > .env
else
	@cat ./docker.vars | /bin/bash ./build-env-docker.sh  >  .env
endif

clean:
	@rm -f .env overwrite.env || true

deploy:
	@echo "deploy $(CI_PROJECT_NAME) into $(DEPLOY_DIR) for $(ENVIRONMENT) to $(TARGET)"
	@echo "get $(DEPLOY_DIR)/overwrite.env ./overwrite.env" | sftp $(TARGET)
	$(MAKE) config
	@echo "put .env $(DEPLOY_DIR)/.env" | sftp $(TARGET)
	@echo "put mongo_setup.sh $(DEPLOY_DIR)/mongo_setup.sh" | sftp $(TARGET)
	@echo "put docker-compose-$(CI_ENVIRONMENT_NAME).yml $(DEPLOY_DIR)/docker-compose.yml" | sftp $(TARGET)
