message(0x99) TinyMsg {
    val: Int;
}

struct Wrap {
    maybeMsg: TinyMsg?;
    other: Int;
}

contract OptMsgStore {
    data: Wrap = Wrap{
        maybeMsg: null,
        other: 5
    };

    init() {
        self.data = Wrap{
            maybeMsg: TinyMsg{ val: 42 },
            other: 55
        };
    }
}