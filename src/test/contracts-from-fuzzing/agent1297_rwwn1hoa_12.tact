message(123) EmbeddedMsg {
    x: Int;
    y: Bool;
}

struct Wrap {
    inner: EmbeddedMsg;
}

contract MessageStruct {
    data: Wrap;

    init() {
        self.data = Wrap {
            inner: EmbeddedMsg {
                x: 42,
                y: true
            }
        };
    }
}