struct InnerMost {
    f: Int = 1;
}
struct Inner {
    im: InnerMost = InnerMost{};
}
struct Outer {
    i: Inner = Inner{};
}

contract DefDeep {
    s: Outer = Outer{};
    init() {
        self.s = Outer{};
    }
}