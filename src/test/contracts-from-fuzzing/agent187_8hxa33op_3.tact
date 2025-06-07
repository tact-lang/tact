struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
}

contract StructInStruct {
    field: NestedStruct;

    init() {
        self.field = NestedStruct{
            inner: InnerStruct{
                value: 123,
            }
        };
    }
}
