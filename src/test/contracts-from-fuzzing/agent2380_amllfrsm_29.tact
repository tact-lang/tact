struct InnerMost {
    x: Int? = null;
}

struct Inner {
    im: InnerMost = InnerMost{};
}

struct Outer {
    optInner: Inner? = null;
    reqInner: Inner = Inner{};
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{};
    }
}