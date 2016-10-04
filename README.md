# Docker Container for the Google App Engine Go SDK

[![Docker Automated build](https://img.shields.io/docker/automated/kujenga/docker-gae-go.svg?maxAge=2592000)]()

The release of macOS Sierra broke the version of Go used by the most recent App Engine SDKs, as [is being discussed](https://groups.google.com/forum/#!topic/google-appengine-go/4AKjwr5d5a8) in the [google-appengine-go](https://groups.google.com/forum/#!forum/google-appengine-go) Google Group.

A suggested workaround is to use a docker container to run the App Engine SDKs in the meantime. This repository is intended to serve that purpose.

## Usage

Pull the image with:

```bash
docker pull kujenga/docker-gae-go
```

You can then run apps with a command similar to the following, where `APPS` is an array of paths starting at `$GOPATH` to the directories containing appengine applications, allowing for an arbitrary number of modules to be run at once.

```bash
docker run \
	--rm \
	-p 8000:8000 \
	-p 8080-8090:8080-8090 \
	-v $GOPATH:/go \
	kujenga/docker-gae-go \
	dev_appserver.py \
	"${APPS[@]}"
```

## References

Influenced by https://github.com/RobLoach/docker-google-appengine although this is a bit simpler with more up to date dependencies.
