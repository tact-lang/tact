struct OptionalStructField {
    nested: Nested?;
}

struct Nested {
    x: Int;
}

contract OptStructField {
    d: OptionalStructField;

    init() {
        self.d = OptionalStructField{ nested: null };
    }
}
