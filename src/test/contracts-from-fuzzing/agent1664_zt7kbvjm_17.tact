message(42) PingMsg {
    num: Int;
}

contract OptMessageStorage {
    ping: PingMsg?;

    init() {
        self.ping = null;
    }
}