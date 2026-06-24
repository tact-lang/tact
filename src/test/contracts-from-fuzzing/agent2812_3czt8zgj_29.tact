struct InnerInner {
    x: Int;
}

struct Inner {
    ii: InnerInner;
}

struct Outer {
    inr: Inner;
}

contract NestedStructDefault {
    data: Outer = Outer{ inr: Inner{ ii: InnerInner{ x: 5 } } };

    init() {}
}