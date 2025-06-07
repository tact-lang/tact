struct OptInner {
    a: Int? = null;
    b: Bool? = null;
}

struct OptMid {
    inner: OptInner? = null;
}

struct OptTop {
    mid: OptMid? = null;
}

contract ComplexOptionalChain {
    top: OptTop;

    init() {
        self.top = OptTop{};
    }
}