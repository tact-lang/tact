struct Inner {
    s: String?;
}

struct Outer {
    label: String?;
    inner: Inner;
}

contract NestedOptionalsStrings {
    state: Outer = Outer{ label: null, inner: Inner{ s: null } };
}