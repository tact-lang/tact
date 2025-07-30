struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    description: String;
}

contract ComplexFields {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            inner: InnerStruct{
                flag: true,
                description: "Test"
            }
        };
    }
}