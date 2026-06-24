struct Inner {
    c: Cell? = null;
}

struct Outer {
    inner: Inner = Inner{};
}

contract TestContract {
    s: Outer = Outer{};

    init() {}
}