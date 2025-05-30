struct Inner {
    foo: Int = 5;
    bar: Bool = false;
}

struct Outer {
    nested: Inner = Inner{};
    flag: Bool?;
}

contract Test {
    data: Outer = Outer{};
}