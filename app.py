from flask import Flask
import socket

app = Flask(__name__)

@app.route('/', methods=['GET'])
def index():
    return "<h4>Hostname: {}</h4>".format(socket.gethostname())
    
if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=8000)
