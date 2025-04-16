from http.server import BaseHTTPRequestHandler, HTTPServer

PORT = 9100 

class Exporter(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/metrics":
            with open("prometheus_metrics.txt", "r") as f:
                metrics = f.read()
            self.send_response(200)
            self.send_header("Content-Type", "text/plain; version=0.0.4")
            self.end_headers()
            self.wfile.write(metrics.encode())
        else:
            self.send_response(404)
            self.end_headers()

if __name__ == "__main__":
    print(f"🚀 Exporter Prometheus lancé sur http://localhost:{PORT}/metrics")
    server = HTTPServer(("", PORT), Exporter)
    server.serve_forever()
