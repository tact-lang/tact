struct InnerMost {
    x: Int;
    y: String = "deep";
}

struct Inner {
    z: Int;
    innerMost: InnerMost;
}

contract TestParams(
    nested: Inner,
) {}
