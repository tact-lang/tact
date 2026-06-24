struct InnerMost {
    deep: Bool;
}

struct Middle {
    inside: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract DeepChain {
    layer: Outer;

    init() {
        self.layer = Outer{
            mid: Middle{
                inside: InnerMost{
                    deep: true,
                },
            },
        };
    }
}