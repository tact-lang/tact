struct InnerMost {
    num: Int;
}

struct InnerOpt {
    inner: InnerMost?;
}

struct MiddleOpt {
    inOpt: InnerOpt?;
}

contract CrazyNest {
    val: MiddleOpt;

    init() {
        self.val = MiddleOpt {
            inOpt: null
        };
    }
}
