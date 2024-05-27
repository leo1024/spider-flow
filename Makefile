# The old school Makefile, following are required targets. The Makefile is written
# to allow building multiple binaries. You are free to add more targets or change
# existing implementations, as long as the semantics are preserved.
#
#   make              - default to 'build' target
#   make lint         - code analysis
#   make test         - run unit test (or plus integration test)
#   make build        - alias to build-local target
#   make build-local  - build local binary targets
#   make build-linux  - build linux binary targets
#   make container    - build containers
#   $ docker login registry -u username -p xxxxx
#   make push         - push containers
#   make clean        - clean up targets
#
# Not included but recommended targets:
#   make e2e-test
#
# The makefile is also responsible to populate project version information.
#

#
# Tweak the variables based on your project.
#

# Build directory.
BUILD_DIR := ./
REGISTRY := hub.byted.org/videoarchprivate
IMAGE_NAME := spider-flow
IMAGE_VERSION := 1.0.0

# All targets.
.PHONY: build

build:
	@docker buildx build -t $(REGISTRY)/$(IMAGE_NAME):$(IMAGE_VERSION)                  \
	  -f $(BUILD_DIR)/Dockerfile_jdk11 .;
