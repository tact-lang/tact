struct Nested {
    a: Int;
    b: Bool;
}

contract OptNestedStruct {
    inner: Nested?;

    init() {
        self.inner = null;
    }
}