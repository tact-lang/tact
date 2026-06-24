struct InnerMost {
    x: Int;
}

struct InnerOpt {
    im: InnerMost?;
}

struct OuterOpt {
    inner: InnerOpt;
}

contract NestedOptionChain {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{ inner: InnerOpt{ im: null } };
    }
}