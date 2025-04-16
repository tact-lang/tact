struct Inner {
    foo: Int;
}

struct Container {
    inner: Inner;
}

contract NestedStructDefault {
    c: Container = Container{inner: Inner{foo: 7}};
}
