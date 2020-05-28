terraform=docker run --rm --env-file=$(shell pwd)/.env --volume=$(shell pwd)/:/src --workdir=/src hashicorp/terraform:light

init:
	$(terraform) init -force-copy
.PHONY: init

validate:
	$(terraform) validate
.PHONY: validate

plan:
	$(terraform) plan -input=false
.PHONY: plan

refresh:
	$(terraform) refresh -input=false
.PHONY: refresh

apply:
	$(terraform) apply -input=false -auto-approve
.PHONY: apply

destroy:
	$(terraform) destroy -input=false -auto-approve
.PHONY: destroy