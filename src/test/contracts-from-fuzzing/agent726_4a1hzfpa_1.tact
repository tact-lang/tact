struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    nested: NestedStruct;
}

struct NestedStruct {
    x: Int;
    y: Bool;
    flag: Bool?;
}

contract TestContract {
    data: DeeplyNested;
    
    init() {
        self.data = DeeplyNested{
            inner: InnerStruct{
                nested: NestedStruct{
                    x: 1,
                    y: true,
                    flag: false
                }
            }
        };
    }
}