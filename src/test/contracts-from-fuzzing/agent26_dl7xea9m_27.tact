struct Inner {
    a: Int? = 5;
    b: Bool? = null;
}

struct Outer {
    inner: Inner = Inner{};
    c: String? = null;
}

contract NestedOpts {
    s: Outer;
    init() {
        self.s = Outer{};
    }
}