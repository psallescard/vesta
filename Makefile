PYTHON          = python
MANAGER         = $(PYTHON) manage.py
LOCAL_IP        ?= 127.0.0.1
LOCAL_PORT      ?= 8000
APP				?=
TW4_EXE 		?= tw4cli.exe
CSS_IN 			= static/src/input.css
CSS_OUT 		= static/css/styles.css

# -------------------------------------------------------------------------------------

.PHONY: migrations migrate run test tw-build tw-watch docs


migrations:
ifeq ($(APP),)
	@echo "An app must be specified."
	@echo ""
	@echo "Usage:"
	@echo "    make migrations APP=<app_name>"
	@echo ""
	exit 1
endif
	$(MANAGER) makemigrations $(APP)

migrate:
	$(MANAGER) migrate

run:
	$(MANAGER) runserver $(LOCAL_IP):$(LOCAL_PORT)

test:
	$(MANAGER) test

tw-build:
	$(TW4_EXE) -i $(CSS_IN) -o $(CSS_OUT)

tw-watch:
	$(TW4_EXE) -i $(CSS_IN) -o $(CSS_OUT) --watch

docs:
	mkdocs serve
