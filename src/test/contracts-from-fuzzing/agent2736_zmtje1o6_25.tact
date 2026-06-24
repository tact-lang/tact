struct InnerMost {
    v: Int;
}

struct InnerOpt {
    inner: InnerMost?;
}

struct MiddleOpt {
    innerOpt: InnerOpt?;
}

contract MultiOptStruct {
    f: MiddleOpt;

    init() {
        self.f = MiddleOpt{
            innerOpt: null
        };
    }
}