message(0x1234) Ping {}

contract OptMsgStorage {
    lastPing: Ping?;

    init() {
        self.lastPing = null;
    }
}