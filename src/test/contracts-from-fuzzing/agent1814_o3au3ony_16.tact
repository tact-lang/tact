struct InnerMost {
    leaf: Int;
}

struct Inner {
    node: InnerMost;
}

contract DeepChain {
    root: Inner;

    init() {
        self.root = Inner{
            node: InnerMost{
                leaf: 100
            }
        };
    }
}
