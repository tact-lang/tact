struct InnerOpt {
    v: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract DoubleOptNested {
    st: OuterOpt;
    init() {
        self.st = OuterOpt{
            inner: null
        };
    }
}