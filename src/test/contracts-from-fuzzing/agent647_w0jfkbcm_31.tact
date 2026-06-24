// optional message nested in struct
message(1) Ping {}

struct WrapMsgOpt {
    ping: Ping?;
}

contract TestContract {
    w: WrapMsgOpt;

    init() {
        self.w = WrapMsgOpt{ ping: null };
    }
}