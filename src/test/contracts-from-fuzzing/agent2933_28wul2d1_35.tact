struct InnerMost {
    v: Int;
}

struct MiddleLayer {
    inner: InnerMost;
}

struct TopLayer {
    mid: MiddleLayer;
    option: MiddleLayer?;
}

contract DeepChainOpts {
    data: TopLayer;

    init() {
        self.data = TopLayer{
            mid: MiddleLayer{ inner: InnerMost{ v: 333 } },
            option: null
        };
    }
}