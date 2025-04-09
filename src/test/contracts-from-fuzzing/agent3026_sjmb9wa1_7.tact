struct DeeplyNested {
    inner: InnerLayer;
}

struct InnerLayer {
    level2: InnerMost;
}

struct InnerMost {
    value: Int;
}

contract NestDepth {
    storage: DeeplyNested;
    init() {
        self.storage = DeeplyNested{
            inner: InnerLayer{
                level2: InnerMost{
                    value: 999
                }
            }
        };
    }
}