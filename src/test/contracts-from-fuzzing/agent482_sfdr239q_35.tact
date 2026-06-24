message(0x01010101) Embedded {
    foo: Int;
}

struct HasMsg {
    bar: Embedded;
    note: String;
}

contract ContainMsg {
    cont: HasMsg;

    init() {
        self.cont = HasMsg{
            bar: Embedded{ foo: 55 },
            note: "hi"
        };
    }
}
