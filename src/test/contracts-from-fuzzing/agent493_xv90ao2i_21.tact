struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    s: String;
    b: Bool;
}

contract OutIn {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            inner: InnerStruct{
                s: "Testing",
                b: true
            }
        };
    }
}