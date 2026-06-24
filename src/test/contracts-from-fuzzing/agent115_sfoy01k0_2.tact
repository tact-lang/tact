struct DeepNested {
    level1: Int;
    level2: Bool;
    level3: String;
}

struct MidNested {
    midInt: Int;
    deep: DeepNested;
}

struct TopNested {
    topBool: Bool;
    mid: MidNested;
}

contract NestedContract {
    nested: TopNested;

    init() {
        self.nested = TopNested{
            topBool: true,
            mid: MidNested{
                midInt: 42,
                deep: DeepNested{level1: 1, level2: false, level3: "wow"}
            }
        };
    }
}
