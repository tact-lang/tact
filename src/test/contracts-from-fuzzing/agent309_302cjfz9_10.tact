struct Inner {
    num: Int;
}

struct Outer {
    inner: Inner;
}

contract OptionalNestedStruct {
    field: Outer?;

    init() {
        self.field = null;
    }
}