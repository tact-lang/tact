struct Nested {
    sub: Inner;
}

struct Inner {
    value: Int;
}

contract ParamNested(
    a: Int,
    b: Bool,
    c: Nested
) {}