# mbentley/registry

Docker image that patches the default registry image.

## Why

The images on Docker Hub are not always updated as regularly as I would like.  They can ship vulnerable libraries/binaries so in order to combat that, I am maintaining my own rebased images.  There are no customizations outside of patching and rebasing the images.

## Tags

* `latest`, `3` - maps to `registry:3`
* `2` - maps to `registry:2`

## Differences

* This image does not add or modify any behavior; only repackages with the latest updates
