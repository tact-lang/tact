message(555) InnerMsg {
    important: Bool;
}

struct Wrapper {
    inner: InnerMsg;
    x: Int;
}

contract NestedMsgField {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: InnerMsg{ important: true },
            x: 77,
        };
    }
}