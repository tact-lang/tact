struct InnerOpt {
    s: String?;
}

struct MiddleOpt {
    inner: InnerOpt?;
}

contract OptionalChain {
    a: MiddleOpt?;

    init() {
        self.a = MiddleOpt{ inner: InnerOpt{ s: null } };
    }
}