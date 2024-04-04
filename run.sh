#!/bin/bash

# Generate video
python video_master.py &

# Broadcast to YouTube
python translation_master.py