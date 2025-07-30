struct InnerMost {
    x: Int;
}

struct InnerOpt {
    optInner: InnerMost?;
}

struct InnerOptOpt {
    optOptInner: InnerOpt?;
}

contract NestedOptionTest {
    data: InnerOptOpt;

    init() {
        self.data = InnerOptOpt{ optOptInner: null };
    }
}