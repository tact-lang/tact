struct DeepNested {
    level1: Int;
    level2: InnerMost;
}

struct InnerMost {
    flag: Bool;
    text: String;
}

contract DeepNestedContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level1: 7,
            level2: InnerMost{
                flag: false,
                text: "deep"
            }
        };
    }
}