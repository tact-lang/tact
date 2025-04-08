contract OptionalStruct {
    nested: Nested?;

    init() {
        self.nested = null;
    }
}

struct Nested {
    x: Int;
    y: Bool;
}