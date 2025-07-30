struct Inner {
    nested: Int?;
}

contract NestedOptionalStruct {
    inner: Inner;

    init() {
        self.inner = Inner{ nested: null };
    }
}