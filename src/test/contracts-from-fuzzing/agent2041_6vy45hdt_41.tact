struct InnerMost {
    value: Int;
}

struct MiddleLayer {
    inner: InnerMost;
}

struct TopLayer {
    middle: MiddleLayer;
}

contract DeepChain {
    content: TopLayer;
    init() {
        self.content = TopLayer{
            middle: MiddleLayer{
                inner: InnerMost{ value: 42 }
            }
        };
    }
}