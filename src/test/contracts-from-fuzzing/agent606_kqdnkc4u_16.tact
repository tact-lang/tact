struct Deep {
    inner: Int;
}

struct Outer {
    nested: Deep;
}

contract P(
    x: Outer
) {}