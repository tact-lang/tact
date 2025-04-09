struct NullableNested {
    inner: String?;
    count: Int;
}

contract OptionalStructCombo {
    foo: NullableNested?;

    init() {
        self.foo = null;
    }
}