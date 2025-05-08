struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    text: String;
}

contract TestContract {
    field: DeepNested;
    
    init() {
        self.field = DeepNested{
            inner: InnerStruct{
                flag: false,
                text: "hi"
            }
        };
    }
}