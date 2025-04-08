struct ComplexNested {
    level1: Int;
    level2: Bool;
    optionalInner: InnerStruct?;
}

struct InnerStruct {
    field1: Int;
    field2: Bool;
}

contract TestContract {
    nested: ComplexNested;

    init() {
        self.nested = ComplexNested{
            level1: 1,
            level2: false,
            optionalInner: InnerStruct{field1: 2, field2: true}
        };
    }
}