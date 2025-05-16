contract OptionalStructField {
    field: Nested?;

    init() {
        self.field = null;
    }
}

struct Nested {
    x: Int;
}