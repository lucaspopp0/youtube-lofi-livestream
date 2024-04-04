build:
	docker build -t radio .
.PHONY: build

run2:
	@\
	#test -z "$$CLIENT_ID" && echo "Missing CLIENT_ID" && exit 1; \
	#test -z "$$CLIENT_SECRET" && echo "Missing CLIENT_SECRET" && exit 1; \
	#test -z "$$YOUTUBE_KEY" && echo "Missing YOUTUBE_KEY" && exit 1; \
	#test -z "$$SPOTIFY_PLAYLIST" && echo "Missing SPOTIFY_PLAYLIST" && exit 1; \
	\
	# ./scripts/spotify-download.sh \
	# 	-i "$$CLIENT_ID" \
	# 	-s "$$CLIENT_SECRET" \
	# 	-o "$(shell pwd)/resources/music_files"
.PHONY: run2

run: build
	docker run \
		-v $(shell pwd):/app \
		-it \
		-e YOUTUBE_STREAM_KEY="your-stream-key" \
		-e VIDEO_GROUPED="5" \
		radio
.PHONY: run