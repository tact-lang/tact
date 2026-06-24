struct InnerMost {
    x: Int;
}

struct InnerOpt {
    val: InnerMost?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract NestedOpts {
    d: OuterOpt;

    init() {
        self.d = OuterOpt{
            inner: null
        };
    }
}
