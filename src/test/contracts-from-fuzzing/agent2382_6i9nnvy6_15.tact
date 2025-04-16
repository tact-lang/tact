struct Wrapper {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
    flag: Bool;
}

contract NestedOrder {
    field: Wrapper;

    init() {
        self.field = Wrapper{
            inner: InnerStruct{
                value: 123,
                flag: true
            }
        };
    }
}