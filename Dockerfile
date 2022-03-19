# start from upstream registry image & upgrade all packages
ARG REGISTRY_TAG="2"
FROM registry:${REGISTRY_TAG} AS upstream

RUN apk --no-cache upgrade --purge

# copy over the contents into a new image
FROM scratch
COPY --from=upstream / /
