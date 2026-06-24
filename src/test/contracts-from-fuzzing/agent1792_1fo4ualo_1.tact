struct NestedStruct {
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
            inner: InnerStruct{
                value: 1,
                flag: true,
            },
        };
    }
}