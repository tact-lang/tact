struct HasOptionalStruct {
    a: Int;
    b: Bool?;
}

struct ComplexOptional {
    s: HasOptionalStruct?;
    x: Int;
}

contract NestedOptionTest {
    data: ComplexOptional;

    init() {
        self.data = ComplexOptional{
            s: HasOptionalStruct{ a: 42, b: false },
            x: 7
        };
    }
}