struct Inner {
    foo: Int;
    bar: Bool;
}

contract OptionalNestedStruct {
    opt: Inner?;

    init() {
        self.opt = null;
    }
}