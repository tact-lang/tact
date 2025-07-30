message(0x12345678) MessageLike {
    foo: Int;
    bar: Bool;
    baz: String?;
}

contract TestContract {
    msgStruct: MessageLike;

    init() {
        self.msgStruct = MessageLike{
            foo: 5,
            bar: true,
            baz: null
        };
    }
}