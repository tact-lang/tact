struct Inner {
    foo: Int = 10;
    bar: Bool = true;
    baz: String = "baz";
}

struct Outer {
    num: Int = 1;
    flag: Bool = false;
    label: String = "a";
    nested: Inner = Inner{};
}

contract TestMixedNested {
    data: Outer = Outer{};
}