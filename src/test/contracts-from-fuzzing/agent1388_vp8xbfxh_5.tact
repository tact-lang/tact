struct Inner {
    foo: Int? = null;
}

struct Outer {
    inner: Inner;
}

contract Test {
    data: Outer = Outer{ inner: Inner{} };
    init() {}
}
