struct OptionalStructField {
    nested: Nested?;
}

struct Nested {
    x: Int;
}

contract Test {
    foo: OptionalStructField;

    init() {
        self.foo = OptionalStructField{
            nested: null
        };
    }
}
