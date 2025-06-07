struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
}

contract TestNestedGetter {
    receive() {}

    get fun getNested(): Outer? {
        return Outer{ inner: Inner{ a: 999, b: false } };
    }
}
