struct InnerMost {
    foo: Int;
}

struct MidInnerOpt {
    inner: InnerMost?;
}

struct MidLevelOpt {
    middle: MidInnerOpt?;
}

struct TopLevelOpt {
    top: MidLevelOpt?;
}

contract TestContract {
    state: TopLevelOpt;
    init() {
        self.state = TopLevelOpt{
            top: null
        };
    }
}
