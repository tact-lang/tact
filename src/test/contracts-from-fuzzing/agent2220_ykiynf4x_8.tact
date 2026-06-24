struct InnerMost {
    z: Int;
}

struct Inner {
    y: InnerMost?;
}

contract Test {
    f: Inner?;
}