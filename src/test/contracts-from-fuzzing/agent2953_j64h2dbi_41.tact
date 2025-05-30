struct InnerMost {
    val: Int?;
}

struct InnerLayer {
    inner: InnerMost;
}

struct MidLayer {
    mid: InnerLayer;
}

struct OuterLayer {
    out: MidLayer;
}

contract NestedOptionalsChain {
    st: OuterLayer;

    init() {
        self.st = OuterLayer{
            out: MidLayer{
                mid: InnerLayer{
                    inner: InnerMost{ val: null }
                }
            }
        };
    }
}