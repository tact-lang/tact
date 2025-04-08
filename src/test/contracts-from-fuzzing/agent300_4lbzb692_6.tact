struct InnerMost {
    x: Int;
}

struct Inner {
    im: InnerMost;
}

contract Test {
    nested: Inner = Inner { im: InnerMost { x: 123 } };
}