struct Inner {
    x: Int = 7;
}

struct Outer {
    y: Int = 42;
    inner: Inner = Inner{};
}

contract TestContract {
    s: Outer = Outer{};
}