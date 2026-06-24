struct Inner {
    foo: Int;
    bar: Int?;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    state: Outer = Outer{ inner: Inner{ foo: 10, bar: null } };
}
