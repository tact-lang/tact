struct InnerMost {
    a: Int;
}

struct MiddleOpt {
    im: InnerMost?;
}

contract NestedOpts {
    opt: MiddleOpt?;

    init() {
        self.opt = null;
    }
}