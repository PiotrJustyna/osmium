docker run -it --rm -v ./:/tmp/haskell osmium /bin/bash -c "rm -rf ~/haskell && cp -r /tmp/haskell ~/ && cd ~/haskell && stack build && stack exec osmium"
