struct Inner {
    foo: Int = 55;
    bar: String = "inner";
}

struct Outer {
    x: Int = 1;
    y: Inner = Inner{};
    z: String = "outer";
}

contract TestContract {
    data: Outer = Outer{ y: Inner{ foo: 99 } };

    init() {}
}