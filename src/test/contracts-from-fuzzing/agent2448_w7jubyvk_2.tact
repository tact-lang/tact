struct DeeplyNested {
    level1: Int;
    level2: Bool;
    optionLevel: InnerStruct?;
}

struct InnerStruct {
    valueA: Bool;
    strVal: String;
}

contract DeepContract {
    storage: DeeplyNested;

    init() {
        self.storage = DeeplyNested {
            level1: 5,
            level2: true,
            optionLevel: InnerStruct{
                valueA: false,
                strVal: "hello",
            },
        };
    }
}
