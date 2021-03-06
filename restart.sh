#!/usr/bin/env bash

kill -15 $(pgrep -f "live_camera_server.py")
kill -15 $(pgrep -f "live_camera_record.py")
kill -15 $(pgrep -f "rtsp://192.168.1.38:554/user=admin_password=_channel=0_stream=0.sdp")

#RTSP_PATH=rtsp://aivisvn.ddns.net:60961/user=admin_password=_channel=0_stream=0.sdp
#RTSP_PATH=rtsp://192.168.1.38:554/user=admin_password=_channel=0_stream=0.sdp
#nohup ffmpeg -v info -rtsp_transport tcp -i $RTSP_PATH -vf scale=1920x1080 -bufsize 1835k -pix_fmt yuv420p -flags -global_header -hls_time 20 -hls_list_size 6 -hls_wrap 20 -start_number 1 static/video/video.m3u8 &
venv/bin/python live_camera_record.py > /dev/null 2>&1 &
venv/bin/python live_camera_server.py > live_camera_server.log 2>&1 &