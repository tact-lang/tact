struct VeryNested {
    deeper: InnerLevel;
}

struct InnerLevel {
    deeperStill: InnerMost;
}

struct InnerMost {
    value: Int;
    flag: Bool;
}

contract TestContract {
    data: VeryNested;

    init() {
        self.data = VeryNested{
            deeper: InnerLevel{
                deeperStill: InnerMost{
                    value: 99,
                    flag: true,
                }
            }
        };
    }
}