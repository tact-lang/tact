struct Inner {
    foo: Int? = null;
}

struct Wrap {
    inner: Inner = Inner{};
}

contract NestedOptDefaults {
    w: Wrap = Wrap{};
}