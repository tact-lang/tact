struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    text: String;
}

contract TestContract {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            inner: InnerStruct{
                flag: true,
                text: "hi"
            }
        };
    }
}