struct OptionalDeep {
    nested: Nested?;
}

struct Nested {
    val: Int;
}

contract OptionalNestedField {
    inner: OptionalDeep;

    init() {
        self.inner = OptionalDeep{ nested: null };
    }
}