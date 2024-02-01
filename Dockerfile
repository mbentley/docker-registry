# start from upstream registry image & upgrade all packages
ARG REGISTRY_TAG="2"
FROM registry:${REGISTRY_TAG} AS upstream

RUN apk --no-cache upgrade --purge

# copy over the contents into a new image
FROM scratch
COPY --from=upstream / /

# disable tracing by default (https://opentelemetry.io/docs/specs/otel/configuration/sdk-environment-variables/)
#   see https://github.com/distribution/distribution/issues/4270
ENV OTEL_TRACES_EXPORTER=none

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/etc/docker/registry/config.yml"]
