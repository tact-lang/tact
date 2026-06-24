struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
    flag: Bool;
    name: String;
}

contract TestContract {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            inner: InnerStruct{
                value: 42,
                flag: true,
                name: "test"
            }
        };
    }
}