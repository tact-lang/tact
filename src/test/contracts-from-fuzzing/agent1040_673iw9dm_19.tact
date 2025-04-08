message(222) InnerMsg {
    val: Int;
}

struct WrapMsg {
    msg: InnerMsg;
    count: Int;
}

contract TestContract {
    stored: WrapMsg;

    init() {
        self.stored = WrapMsg{
            msg: InnerMsg{ val: 11 },
            count: 42
        };
    }
}