# Dockerfile for singularity
## How to build
```console
# docker build --squash -t singularity .
```

## How to use

Note that `--privileged` option is necessary.
```console
$ docker run --privileged --rm singularity run docker://docker/whalesay cowsay Have fun!
INFO:    Converting OCI blobs to SIF format
INFO:    Starting build...
...
INFO:    Creating SIF file...
INFO:    Build complete: /root/.singularity/cache/oci-tmp/5c4e775d78c1cea50b0fed8f760cca8eba0041e1409570bbd1a14deacd4688df/whalesay_latest.sif
 ___________
< Have fun! >
 -----------
    \
     \
      \
                    ##        .
              ## ## ##       ==
           ## ## ## ##      ===
       /""""""""""""""""___/ ===
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
       \______ o          __/
        \    \        __/
          \____\______/
```
