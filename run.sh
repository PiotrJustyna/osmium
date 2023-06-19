docker run -it --rm -p 5901:5901 -p 6080:6080 -v ./:/tmp/haskell/ osmium /bin/bash -c "cp -r /tmp/haskell/ ~/haskell/ && cd ~/haskell/ && stack build && stack exec osmium-exe"
