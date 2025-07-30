struct Inner {
    foo: Int?;
}

message(99) Msg {
    inner: Inner?;
    bar: Bool;
}

contract MsgNestedOptional {
    data: Msg?;

    init() {
        self.data = null;
    }
}