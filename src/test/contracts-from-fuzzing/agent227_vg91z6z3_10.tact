message(5) Ping {
    x: Int;
}

contract OptionalMessageField {
    ping: Ping?;

    init() {
        self.ping = null;
    }

    receive() {
        let _ = self.ping;
    }
}
