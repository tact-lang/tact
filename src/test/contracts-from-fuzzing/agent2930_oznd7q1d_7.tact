contract OptionalRoot {
    nested: Nested?;

    init() {
        self.nested = null;
    }
}

struct Nested {
    value: Int;
}
