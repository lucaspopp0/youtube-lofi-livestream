#!/bin/bash

mkdir -p resources/music_files
mkdir -p resources/ready_videos

# Generate video
python video_master.py &

# Broadcast to YouTube
python translation_master.py