struct Inner {
    y: Bool?;
}

struct Outer {
    inner: Inner;
}

contract DeepNestedOpt {
    field: Outer = Outer{inner: Inner{y: null}};
}