struct DeeplyNested {
    inner1: InnerStruct;
}

struct InnerStruct {
    nestedOpt: NestedOpt?;
}

struct NestedOpt {
    x: Int;
    flag: Bool;
}

contract TestContract {
    complexField: DeeplyNested;
    
    init() {
        self.complexField = DeeplyNested{
            inner1: InnerStruct{
                nestedOpt: NestedOpt{
                    x: 42,
                    flag: true
                }
            }
        };
    }
}
