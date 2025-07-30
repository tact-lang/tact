struct DeeplyNested {
    inner1: InnerStruct1;
}

struct InnerStruct1 {
    inner2: InnerStruct2;
    num: Int;
}

struct InnerStruct2 {
    flag: Bool;
    text: String;
}

contract TestContract {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            inner1: InnerStruct1{
                inner2: InnerStruct2{
                    flag: true,
                    text: "hello"
                },
                num: 42
            }
        };
    }
}
