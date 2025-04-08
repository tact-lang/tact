struct DeepNested {
    val: Int;
    flag: Bool;
}

struct MiddleNested {
    deep: DeepNested;
    text: String;
}

struct TopNested {
    middle: MiddleNested;
    optVal: Int?;
}

contract DeepStorage {
    data: TopNested;

    init() {
        self.data = TopNested{
            middle: MiddleNested{
                deep: DeepNested{ val: 42, flag: true },
                text: "test"
            },
            optVal: null
        };
    }
}