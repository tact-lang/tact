message PingMsg {
    count: Int;
}

struct MsgWrapper {
    ping: PingMsg;
    ok: Bool;
}

contract StructHoldingMessagePersist {
    data: MsgWrapper;

    init() {
        self.data = MsgWrapper{
            ping: PingMsg{ count: 88 },
            ok: true
        };
    }
}