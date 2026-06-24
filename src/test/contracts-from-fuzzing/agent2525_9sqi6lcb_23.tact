// Contract params with nested struct fields

struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    msg: String;
}

contract ParamsNested(
    param: Outer,
) {}