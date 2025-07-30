struct DeeplyNested {
    sub1: SubStruct1;
}

struct SubStruct1 {
    sub2: SubStruct2;
}

struct SubStruct2 {
    sub3: SubStruct3;
}

struct SubStruct3 {
    value: Int;
}

contract TestContract {
    complexField: DeeplyNested;

    init() {
        self.complexField = DeeplyNested{
            sub1: SubStruct1{
                sub2: SubStruct2{
                    sub3: SubStruct3{
                        value: 42
                    }
                }
            }
        };
    }
}