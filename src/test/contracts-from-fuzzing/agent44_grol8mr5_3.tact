message(1) Ping {
    count: Int;
}

contract OptMsgContract {
    ping: Ping?;

    init() {
        self.ping = null;
    }
}