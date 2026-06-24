struct InnerMost {
    z: Int;
}

struct Inner {
    y: InnerMost;
}

contract Test {
    f: Inner = Inner{ y: InnerMost{ z: 7 } };
}