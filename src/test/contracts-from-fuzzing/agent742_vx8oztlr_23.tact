struct Inner {
    foo: Int;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    outer: Outer? = null;
    init() {}
}