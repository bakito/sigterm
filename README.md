# sigterm

Small docker images demonstrating signal handling in docker/kubernetes

## raw - ghcr.io/bakito/sigterm:1.0.0-raw

Starting the binary directly

```Dockerfile
CMD ["/app/run-me"]
```

## bash - ghcr.io/bakito/sigterm:1.0.0-bash

Starting the binary via a bash shell script

```shell
#!/bin/bash
/app/run-me
```

```Dockerfile
CMD ["/bin/bash", "-c", "/app/bash.sh "]
```

## bash - ghcr.io/bakito/sigterm:1.0.0-bash-exec

Starting the binary via a bash shell script using `exec`

```shell
#!/bin/bash
exec /app/run-me
```

```Dockerfile
CMD ["/bin/bash", "-c", "/app/bash-exec.sh "]
```

## bash - ghcr.io/bakito/sigterm:1.0.0-bash-dumb-init

Starting the binary via a bash shell script initialized via [dumb-init](https://github.com/Yelp/dumb-init)

```shell
#!/bin/bash
/app/run-me
```

```Dockerfile
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/bin/bash", "-c", "/app/bash.sh"]
```


