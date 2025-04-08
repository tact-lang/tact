struct InnerMost {
    z: Int?;
}

struct Mid {
    y: InnerMost?;
}

struct Top {
    x: Mid?;
}

contract OptionChain {
    data: Top;

    init() {
        self.data = Top{
            x: Mid{
                y: InnerMost{
                    z: null,
                },
            },
        };
    }
}
