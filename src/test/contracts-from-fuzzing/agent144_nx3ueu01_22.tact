struct OptionalComplex {
    a: Int?;
    s: String?;
    nested: Nested?;
}

struct Nested {
    val: Int;
}

contract OptionalNestedComplex {
    foo: OptionalComplex;

    init() {
        self.foo = OptionalComplex{
            a: null,
            s: null,
            nested: null
        };
    }
}
