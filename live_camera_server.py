from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def stream():
    return render_template('stream_camera.html')

@app.route('/test')
def stream2():
    return render_template('stream2.html')

if __name__=="__main__":
    app.run('0.0.0.0', 8081, debug=True)