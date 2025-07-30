// Nullable message struct in a struct
message(1) MsgA {
    foo: Int;
}

struct WrapMsg {
    m: MsgA?;
}

contract TestContract {
    w: WrapMsg;

    init() {
        self.w = WrapMsg{ m: null };
    }
}