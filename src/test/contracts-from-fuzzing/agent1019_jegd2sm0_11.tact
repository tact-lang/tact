struct Inner {
    foo: Int = 1;
    bar: Bool = false;
}

struct Outer {
    nested: Inner = Inner{bar: true};
}

contract TestContract {
    data: Outer = Outer{};

    init() {}
}