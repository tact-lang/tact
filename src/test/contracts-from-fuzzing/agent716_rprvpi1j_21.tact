message(42) MsgInner {
    foo: Int;
    bar: Bool?;
}

struct MsgWrap {
    inner: MsgInner;
}

contract MessagePersist {
    data: MsgWrap;

    init() {
        self.data = MsgWrap{
            inner: MsgInner{ foo: 5, bar: null }
        };
    }
}