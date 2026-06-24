struct DeeplyNested {
    level1: Int;
    sub: SubStruct;
}

struct SubStruct {
    flag: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    note: String;
    num: Int?;
}

contract UseDeepNested {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            level1: 1,
            sub: SubStruct{
                flag: false,
                inner: InnerStruct{
                    note: "hello",
                    num: null
                }
            }
        };
    }
}