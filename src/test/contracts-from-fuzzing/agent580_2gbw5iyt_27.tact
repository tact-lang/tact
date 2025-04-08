struct InnerMost {
    x: Int?
}

struct Inner {
    foo: Int;
    bar: Bool;
    deep: InnerMost?;
}

struct Outer {
    nested: Inner;
    nopt: Inner?;
}

contract LargeOptionalParam(
    outer: Outer?
) {}