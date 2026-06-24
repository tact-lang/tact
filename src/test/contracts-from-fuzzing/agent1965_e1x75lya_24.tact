struct Wrap {
    inner: Inner;
}

struct Inner {
    a: Int;
    b: Int;
}

contract ParamNested(
    w: Wrap,
) {}