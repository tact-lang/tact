struct ComplexOptional {
    foo: Int?;
    bar: Bool?;
    nested: Nested?;
}

struct Nested {
    val: Int;
}

contract ComplexOptionalField {
    state: ComplexOptional;

    init() {
        self.state = ComplexOptional{
            foo: null,
            bar: null,
            nested: null
        };
    }
}