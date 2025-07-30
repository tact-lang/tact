message(0xAAAABBBB) Innermsg {
    foo: Int;
}

struct HasMsg {
    m: Innermsg;
    info: String;
}

contract StoreMsgField {
    state: HasMsg;

    init() {
        self.state = HasMsg{
            m: Innermsg{ foo: 42 },
            info: "hello"
        };
    }
}
