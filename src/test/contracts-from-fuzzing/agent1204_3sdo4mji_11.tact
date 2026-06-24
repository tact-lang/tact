struct NestedOptional {
    inner: Int?;
}

contract OptionalField {
    foo: NestedOptional?;

    init() {
        self.foo = null;
    }
}
