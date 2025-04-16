// test message inside struct in persistent storage
message(1) InnerMsg {
    x: Int;
}

struct WrapMsg {
    inner: InnerMsg;
}

contract TestMessageWrap {
    val: WrapMsg;

    init() {
        self.val = WrapMsg{inner: InnerMsg{x: 42}};
    }
}
