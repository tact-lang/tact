message(11) Ping { id: Int; }
message(22) Pong { id: Int; }
message(33) Hello { id: Int; }

contract TestContract {
    ping: Ping;
    pong: Pong;
    hello: Hello;

    init() {
        self.ping = Ping{ id: 1 };
        self.pong = Pong{ id: 2 };
        self.hello = Hello{ id: 3 };
    }
}