struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner: InnerStruct{
                value: 42,
            },
        };
    }
}
