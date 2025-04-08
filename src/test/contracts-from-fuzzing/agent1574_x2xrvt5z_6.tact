struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    flag: Bool;
    text: String;
}

contract OptionalNestedStruct {
    s: OptionalNested;

    init() {
        self.s = OptionalNested{
            inner: null
        };
    }
}