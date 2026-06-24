struct DeepNested {
    val: Int;
}

struct MiddleNested {
    deep: DeepNested;
    optBool: Bool?;
}

struct TopLevel {
    middle: MiddleNested;
    flag: Bool;
}

contract DeepNestContract {
    storage: TopLevel;

    init() {
        self.storage = TopLevel{
            middle: MiddleNested{
                deep: DeepNested{ val: 99 },
                optBool: null,
            },
            flag: true,
        };
    }
}
