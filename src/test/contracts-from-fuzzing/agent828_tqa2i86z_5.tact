struct Inner {
    foo: Int;
    bar: Bool;
}

message(0x42) MyMsg {
    baz: Int;
    nested: Inner;
}

contract TestContract {
    data: MyMsg;

    init() {
        self.data = MyMsg{
            baz: 123,
            nested: Inner{
                foo: 999,
                bar: true
            }
        };
    }
}