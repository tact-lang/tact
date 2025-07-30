message(101) MsgFoo {
    a: Int;
    b: Bool;
}

contract OptionalMsgStored {
    foo: MsgFoo?;

    init() {
        self.foo = MsgFoo{
            a: 50,
            b: true
        };
    }
}