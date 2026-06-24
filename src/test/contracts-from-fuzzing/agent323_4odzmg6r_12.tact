message(42) Ping {
    seq: Int;
    tag: Bool?;
}

contract Test {
    lastPing: Ping;

    init() {
        self.lastPing = Ping{
            seq: 100,
            tag: true,
        };
    }
}