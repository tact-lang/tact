struct Inner {
    foo: Int;
    bar: Bool?;
}

contract OptionalInsideInnerStruct {
    data: Inner?;

    init() {
        self.data = null;
    }
}