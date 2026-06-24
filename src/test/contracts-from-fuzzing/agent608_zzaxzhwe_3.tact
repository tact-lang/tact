struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
    y: Int;
}

contract Test {
    nested: Outer = Outer{inner: Inner{x: 5}, y: 7};
}
