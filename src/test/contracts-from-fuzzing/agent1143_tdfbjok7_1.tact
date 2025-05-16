struct NestedStruct {
    field1: Int;
    field2: Bool;
    nested: InnerStruct;
}

struct InnerStruct {
    value: Int;
    flag: Bool;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            field1: 1,
            field2: true,
            nested: InnerStruct{
                value: 42,
                flag: false,
            }
        };
    }
}