struct InnerMost {
    z: Int;
}

struct Inner {
    y: InnerMost;
}

struct Outer {
    x: Inner;
}

contract NestedOptionalField {
    nestedOpt: Outer?;
}