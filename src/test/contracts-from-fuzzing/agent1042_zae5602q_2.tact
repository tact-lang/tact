struct Inner {
    a: Int;
}

struct Outer {
    b: Int;
    inner: Inner;
}

contract DeepNested {
    field: Outer = Outer{b:1, inner: Inner{a:2}};
}