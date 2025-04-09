struct InnerMost {
    x: Int;
    y: Bool?;
}

struct MiddleLayer {
    inner: InnerMost;
}

struct OuterLayer {
    middle: MiddleLayer;
}

contract MultiLayerNested {
    nested: OuterLayer;

    init() {
        self.nested = OuterLayer{
            middle: MiddleLayer{
                inner: InnerMost{
                    x: 42,
                    y: false
                }
            }
        };
    }
}