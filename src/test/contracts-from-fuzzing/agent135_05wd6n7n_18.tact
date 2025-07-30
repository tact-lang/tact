struct InnerDeepOpt {
    val: Int?;
}

struct MiddleDeepOpt {
    inner: InnerDeepOpt?;
}

struct OuterDeepOpt {
    middle: MiddleDeepOpt?;
}

contract MultiOptDepth {
    data: OuterDeepOpt;

    init() {
        self.data = OuterDeepOpt{
            middle: null
        };
    }
}
