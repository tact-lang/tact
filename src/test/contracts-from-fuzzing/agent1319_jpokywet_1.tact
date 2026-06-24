struct DeepNested {
    inner1: InnerStruct1;
}

struct InnerStruct1 {
    inner2: InnerStruct2;
}

struct InnerStruct2 {
    inner3: InnerStruct3;
}

struct InnerStruct3 {
    val: Int;
}

contract DeepNestedContract {
    nested: DeepNested;
    
    init() {
        self.nested = DeepNested{
            inner1: InnerStruct1{
                inner2: InnerStruct2{
                    inner3: InnerStruct3{
                        val: 123
                    }
                }
            }
        };
    }
}
