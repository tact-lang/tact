struct SimpleNested {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
}

contract UsesNestedStruct {
    data: SimpleNested;
    init() {
        self.data = SimpleNested{ inner: InnerStruct{ value: 123 } };
    }
}