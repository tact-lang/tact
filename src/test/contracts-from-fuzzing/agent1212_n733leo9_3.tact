struct Inner {
    x: Int = 10;
    y: String = "inner";
    z: Bool? = null;
}

struct Outer {
    a: Inner;
    b: Int = 99;
    c: String? = null;
}

contract NestedStorage {
    data: Outer = Outer{
        a: Inner{},
        b: 42,
        c: null,
    };
    init() {}
}