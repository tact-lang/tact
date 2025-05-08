struct DeeplyNested {
    s1: String;
    s2: String?;
    sub: SubStruct;
}

struct SubStruct {
    innerValue: Int;
    optInner: Int?;
}

contract DeepContract {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            s1: "hi",
            s2: null,
            sub: SubStruct{
                innerValue: 2,
                optInner: null
            }
        };
    }
}