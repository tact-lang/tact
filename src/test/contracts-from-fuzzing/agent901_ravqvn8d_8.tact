struct Inner {
    x: Int;
    y: String;
}

contract OptionalNestedStruct {
    inner: Inner?;

    init() {
        self.inner = null;
    }
}