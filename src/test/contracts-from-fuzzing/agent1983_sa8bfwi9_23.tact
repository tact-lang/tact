message(0x2345) MInner {
    v: Int;
}

struct WrapMsg {
    inner: MInner;
}

contract NestedMsgStorage {
    data: WrapMsg;

    init() {
        self.data = WrapMsg{
            inner: MInner{ v: 99 }
        };
    }
}