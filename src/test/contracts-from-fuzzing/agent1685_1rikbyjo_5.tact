struct InnerMost {
    leaf: Int;
}

struct Inner {
    inside: InnerMost;
}

struct Mid {
    midInner: Inner;
}

struct Outer {
    wrapMid: Mid;
}

contract NestedTree {
    tree: Outer;

    init() {
        self.tree = Outer{
            wrapMid: Mid{
                midInner: Inner{
                    inside: InnerMost{
                        leaf: 42
                    }
                }
            }
        };
    }
}
