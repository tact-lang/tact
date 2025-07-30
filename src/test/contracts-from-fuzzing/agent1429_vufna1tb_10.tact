struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract OptionalNestedField {
    inner: Nested?;

    init() {
        self.inner = null;
    }
}
