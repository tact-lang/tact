struct InnerMost {
    x: Int = 7;
    y: Bool? = null;
}

struct Middle {
    inner: InnerMost = InnerMost{};
}

struct Outer {
    mid: Middle = Middle{};
}

contract TestContract {
    data: Outer = Outer{};
    init() {}
}
