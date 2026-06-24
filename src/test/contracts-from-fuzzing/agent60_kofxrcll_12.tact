struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner?;
}

contract TestNestedGetter {

    receive() {}

    get fun nestedGetter(): Outer {
        if (true) {
            return Outer { inner: Inner { value: 123 } };
        } else {
            return Outer { inner: null };
        }
    }
}
