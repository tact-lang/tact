struct Inner {
    name: String?;
}

struct Outer {
    value: Int;
    inner: Inner?;
}

contract ParamNested(
    state: Outer,
) {}