struct InnerMost {
    flag: Bool;
}

struct MiddleOpt {
    inner: InnerMost?;
}

struct OuterMost {
    mid: MiddleOpt;
}

contract ChainOpt {
    state: OuterMost;

    init() {
        self.state = OuterMost{
            mid: MiddleOpt{
                inner: null
            }
        };
    }
}