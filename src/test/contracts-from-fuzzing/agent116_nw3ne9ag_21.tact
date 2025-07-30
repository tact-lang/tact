contract MsgOptNested {
    foo: Msg;

    init() {
        self.foo = Msg{
            opt: null,
            x: 42
        };
    }
}

message Msg {
    opt: Nested?;
    x: Int;
}

struct Nested {
    y: Int;
}
