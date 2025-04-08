// deep optional with nested message inside
message(99) Msg {
    val: Int;
}

struct MsgWrap {
    a: Msg?;
}

struct TopWrap {
    inner: MsgWrap?;
    flag: Bool;
}

contract OptionalMsg {
    data: TopWrap;

    init() {
        self.data = TopWrap{
            inner: null,
            flag: true
        };
    }
}