struct OptionalNested {
    innerOpt: Int?;
}

struct ComplexOptional {
    nested: OptionalNested?;
    another: Bool?;
}

contract OptionalStructStorage {
    composite: ComplexOptional;

    init() {
        self.composite = ComplexOptional{
            nested: OptionalNested{ innerOpt: 42 },
            another: null
        };
    }
}