struct Inner {
    i: Int = 99;
    s: String? = null;
}

struct Outer {
    x: Int;
    y: Bool = true;
    z: Inner = Inner{};
}

contract TestContract {
    field: Outer = Outer{x: 42};

    init() {}
}