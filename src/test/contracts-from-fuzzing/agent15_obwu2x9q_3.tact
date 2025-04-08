struct DeepNested {
    level2: NestedStruct;
    flag: Bool;
}

struct NestedStruct {
    num: Int;
    opt: Int?;
    innerBool: Bool;
}

contract DeeplyNested {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level2: NestedStruct{
                num: 123,
                opt: null,
                innerBool: false,
            },
            flag: true,
        };
    }
}