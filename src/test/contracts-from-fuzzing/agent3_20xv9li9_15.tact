message(0x1234) MsgExample {
    foo: Int;
}

struct WithMessage {
    m: MsgExample;
    x: Int;
}

contract MessageNested {
    data: WithMessage;

    init() {
        self.data = WithMessage{
            m: MsgExample{ foo: 7 },
            x: 123,
        };
    }
}