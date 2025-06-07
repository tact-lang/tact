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
    value: Int;
}

contract TestContract {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            inner1: InnerStruct1{
                inner2: InnerStruct2{
                    inner3: InnerStruct3{
                        value: 42
                    }
                }
            }
        };
    }
}