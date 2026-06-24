struct InnerMost {
    z: Int;
}

struct MidLevel {
    middle: InnerMost;
}

struct TopLevel {
    top: MidLevel;
}

contract DeepThreeLayers {
    nested: TopLevel;

    init() {
        self.nested = TopLevel{
            top: MidLevel{
                middle: InnerMost{
                    z: 42,
                },
            },
        };
    }
}