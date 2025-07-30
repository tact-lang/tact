struct DeeplyNested {
    inner1: InnerStruct1;
}

struct InnerStruct1 {
    inner2: InnerStruct2;
}

struct InnerStruct2 {
    flag: Bool;
    optNum: Int?;
    text: String;
}

contract NestedContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            inner1: InnerStruct1{
                inner2: InnerStruct2{
                    flag: true,
                    optNum: null,
                    text: "hello"
                }
            }
        };
    }
}
