struct NestedOptional {
    nested: Bool?;
}

struct OptionalNestedStruct {
    f1: Int;
    f2: NestedOptional?;
}

contract ComplexNull {
    data: OptionalNestedStruct;
    init() {
        self.data = OptionalNestedStruct {
            f1: 0,
            f2: null
        };
    }
}