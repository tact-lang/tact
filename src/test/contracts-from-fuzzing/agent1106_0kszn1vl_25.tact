struct InnerMost {
    a: Int;
}

struct MiddleOne {
    inner: InnerMost;
    optBool: Bool?;
    optStr: String?;
}

struct MiddleTwo {
    inner: InnerMost;
}

struct RootNest {
    m1: MiddleOne;
    m2: MiddleTwo;
}

contract DeepComposite {
    root: RootNest;

    init() {
        self.root = RootNest{
            m1: MiddleOne{ inner: InnerMost{a:0}, optBool:null, optStr:null },
            m2: MiddleTwo{ inner: InnerMost{a:1} }
        };
    }
}