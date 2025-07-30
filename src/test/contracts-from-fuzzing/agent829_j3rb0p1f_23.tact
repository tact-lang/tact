struct OuterMost {
    level1: Int;
    level2: InnerMost;
}

struct InnerMost {
    flag: Bool;
    text: String;
}

contract NestedOrder {
    deepField: OuterMost;

    init() {
        self.deepField = OuterMost{
            level1: 42,
            level2: InnerMost{
                flag: true,
                text: "deep",
            },
        };
    }
}