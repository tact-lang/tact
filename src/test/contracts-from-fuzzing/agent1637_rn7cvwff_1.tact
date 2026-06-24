struct InnerStruct {
    x: Int;
    y: Int?;
}

struct NestedStruct {
    field1: Int;
    nested: InnerStruct;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            field1: 1,
            nested: InnerStruct{
                x: 2,
                y: null
            }
        };
    }
}