import subprocess
import time

def record():
    ffmpegCMD = 'ffmpeg -rtsp_transport tcp -i rtsp://192.168.1.38:554/user=admin_password=_channel=0_stream=0.sdp ' \
                '-c:v copy -c:a copy -bufsize 1835k -pix_fmt yuv420p -flags -global_header ' \
                '-hls_time 10 -hls_list_size 6 -hls_wrap 10 ' \
                '-start_number 1 static/video/video.m3u8'
    while True:
        recordProcess = subprocess.Popen(ffmpegCMD.split(' '))
        time.sleep(3600)
        recordProcess.kill()
        recordProcess.terminate()

if __name__=="__main__":
    record()