struct OptionalNested {
    inner: Inner?;
    flag: Bool;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract OptionalNestedStruct {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: null,
            flag: true,
        };
    }
}
