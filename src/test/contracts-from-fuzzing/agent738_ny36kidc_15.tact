struct InnerMost {
    z: Bool?;
}

struct Middle {
    y: InnerMost?;
}

struct Outer {
    x: Middle?;
}

contract OptionalChains {
    optChain: Outer;

    init() {
        self.optChain = Outer{
            x: Middle{
                y: InnerMost{
                    z: null,
                },
            },
        };
    }
}