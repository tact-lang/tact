struct OptionalNestedStruct {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestOptionalNested {
    s: OptionalNestedStruct;
    init() {
        self.s = OptionalNestedStruct{
            inner: null
        };
    }
}