struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
}

contract Test {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{ inner: InnerStruct{ value: 1 } };
    }
}