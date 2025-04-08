struct Inner {
    foo: Int = 77;
    bar: Bool? = null;
}

struct Outer {
    baz: Inner = Inner{};
    qux: Int = 88;
}

contract DefaultsDeep {
    data: Outer = Outer{};
}