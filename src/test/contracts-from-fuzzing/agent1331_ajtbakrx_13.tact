struct Inner {
    f1: Int?;
    f2: Bool;
}

struct Outer {
    a: Bool?;
    b: Inner;
}

contract NestedStructComplex {
    s: Outer = Outer{a: null, b: Inner{f1: 7, f2: false}};
}