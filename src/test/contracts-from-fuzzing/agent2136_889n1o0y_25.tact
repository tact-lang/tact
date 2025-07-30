struct Inner {
    small: Int as uint8 = 7;
}

struct Outer {
    nested: Inner = Inner{};
}

contract TestContract {
    v: Outer = Outer{};

    init() {}
}