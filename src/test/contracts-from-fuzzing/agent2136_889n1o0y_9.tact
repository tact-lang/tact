struct Inner {
    z: Int = 42;
}

struct Outer {
    inner: Inner = Inner{};
}

contract TestContract {
    s: Outer = Outer{};

    init() {}
}