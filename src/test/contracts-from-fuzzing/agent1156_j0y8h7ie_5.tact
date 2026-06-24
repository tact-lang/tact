struct Inner {
    x: Int = 77;
}

struct Outer {
    a: Inner;
    b: Inner;
    c: Int = 9;
}

contract NestedMany {
    outer: Outer = Outer{a: Inner{}, b: Inner{}};
    init() {}
}