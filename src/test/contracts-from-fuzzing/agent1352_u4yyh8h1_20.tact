message(0x11111111) MyMsg {
    data: Int;
}

struct WrapMsg {
    msg: MyMsg;
}

contract TestContract {
    wrapped: WrapMsg;

    init() {
        self.wrapped = WrapMsg{ msg: MyMsg{ data: 99 } };
    }
}
