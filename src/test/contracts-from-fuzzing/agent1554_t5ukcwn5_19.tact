struct Inner {
    n: Int;
    s: String?;
}

contract NullableNestedStruct {
    inner: Inner?;

    init() {
        self.inner = null;
    }
}