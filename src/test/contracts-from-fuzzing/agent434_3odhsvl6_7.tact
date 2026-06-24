struct Inner {
    foo: Int;
    bar: Bool;
}

contract OptionalStruct {
    data: Inner?;

    init() {
        self.data = null;
    }

    receive() {}
}
