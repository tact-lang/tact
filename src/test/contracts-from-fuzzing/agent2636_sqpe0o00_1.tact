struct NestedStruct {
    field1: Int;
    optField: Bool?;
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
}

contract TestContract {
    st: NestedStruct;

    init() {
        self.st = NestedStruct{
            field1: 1,
            optField: null,
            inner: InnerStruct{ value: 2 },
        };
    }
}