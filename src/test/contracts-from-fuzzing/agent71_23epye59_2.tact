struct DeepNested {
    first: Int;
    second: NestedStruct;
    optional_nested: NestedStruct?;
}

struct NestedStruct {
    a: Int;
    b: Int?;
}

contract TestContract {
    field: DeepNested;

    init() {
        self.field = DeepNested{
            first: 10,
            second: NestedStruct{ a: 1, b: null },
            optional_nested: null,
        };
    }
}