contract OptionalStructs {
    nested: Nested?;

    init() {
        self.nested = null;
    }
}

struct Nested {
    f: Int;
    s: String;
}