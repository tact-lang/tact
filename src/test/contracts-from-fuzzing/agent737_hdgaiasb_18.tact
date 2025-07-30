struct InnerOpt {
    maybe: Int?;
}

struct OuterOpt {
    inner1: InnerOpt?;
    inner2: InnerOpt;
}

contract TestContract {
    f: OuterOpt;

    init() {
        self.f = OuterOpt{
            inner1: null,
            inner2: InnerOpt{ maybe: 7 }
        };
    }
}
