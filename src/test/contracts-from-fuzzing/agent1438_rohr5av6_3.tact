struct DeeplyNested {
    inner1: InnerStruct1;
}

struct InnerStruct1 {
    inner2: InnerStruct2;
}

struct InnerStruct2 {
    val: Int;
}

contract DeepNestTest {
    val: DeeplyNested;

    init() {
        self.val = DeeplyNested{
            inner1: InnerStruct1{
                inner2: InnerStruct2{
                    val: 42,
                }
            }
        };
    }
}