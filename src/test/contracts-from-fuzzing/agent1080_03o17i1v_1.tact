struct NestedStruct {
    field1: Int;
    field2: Bool;
    inner: InnerStruct;
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
            inner: InnerStruct{ value: 10, flag: false },
        };
    }
}