contract Test {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            data: InnerStruct{
                a: 10,
                b: 20
            },
            value: 42
        };
    }
}

struct NestedStruct {
    data: InnerStruct;
    value: Int;
}

struct InnerStruct {
    a: Int;
    b: Int;
}