struct InnerMost {
    z: Int;
}

struct Inner {
    im: InnerMost? = null;
}

struct Outer {
    inner: Inner = Inner{};
}

contract TestContract {
    s: Outer = Outer{};

    init() {}
}