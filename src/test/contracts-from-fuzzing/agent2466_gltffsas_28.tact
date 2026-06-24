struct Outer {
    x: Int;
    y: Inner;
}

struct Inner {
    foo: Int?;
}

contract NestedOptInner {
    outer: Outer = Outer{
        x:5,
        y: Inner{foo:null}
    };
    init() {}
}