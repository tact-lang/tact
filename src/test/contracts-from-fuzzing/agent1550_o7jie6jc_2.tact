struct NestedStruct {
    field1: Int;
    field2: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    b: Int;
    optC: Int?;
}

contract NestedStructContract {
    s: NestedStruct;
    init() {
        self.s = NestedStruct{
            field1: 1,
            field2: true,
            inner: InnerStruct{
                b: 2,
                optC: null,
            },
        };
    }
}