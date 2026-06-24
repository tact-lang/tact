message(0xD2) Inner { x: Int? }

struct WrapMsg {
    inner: Inner;
}

contract MsgInStructWithOpt {
    data: WrapMsg;

    init() {
        self.data = WrapMsg{ inner: Inner{ x: null } };
    }
}
