# Docker Container for the Google App Engine Go SDK

[![Docker Automated build](https://img.shields.io/docker/automated/kujenga/docker-gae-go.svg?maxAge=2592000)]()

The release of macOS Sierra broke the version of Go used by the most recent App Engine SDKs, as [is being discussed](https://groups.google.com/forum/#!topic/google-appengine-go/4AKjwr5d5a8) in the [google-appengine-go](https://groups.google.com/forum/#!forum/google-appengine-go) Google Group.

A suggested workaround is to use a docker container to run the App Engine SDKs in the meantime. This repository is intended to serve that purpose.

## Usage

Pull the image with:

```bash
docker pull kujenga/docker-gae-go
```

Included in this repository is a script, `run.sh`, which can be used to run the container in conjunction with App Engine apps living within your local `GOPATH`.

You can then run apps with a command similar to the following, where the `run.sh` script is living somewhere in your `GOPATH`, and the arguments passed into it are the relative paths of App Engine applications, allowing for an arbitrary number of modules to be run at once.

For example, if the `run.sh` script lives at `$GOPATH/src/github.com/run.sh` and you want to run three app engine applications within the `myorg` organization, you would use the following command.

```bash
./run.sh \
    myorg/app1/default/app.yaml \
    myorg/app1/worker/app.yaml \
    myorg/app2/app.yaml
```

### Note:
I found the `--host='0.0.0.0'` flag to be required, since it doesn't seem to be possible to connect to anything listing just on local ports within the Docker container. Additionally, at the current time I'm not able to conenct to the admin console from `localhost` outside of the container

## References

Influenced by https://github.com/RobLoach/docker-google-appengine although this is a bit simpler with more up to date dependencies.
