struct Inner {
    x: Int = 100;
}

struct Outer {
    inner: Inner = Inner{};
}

contract TestContract {
    nested: Outer = Outer{};
}