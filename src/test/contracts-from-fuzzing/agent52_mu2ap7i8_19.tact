struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner;
}

contract TestNestedGetter {
    v: Int = 50;

    receive() {}

    // Getter returning a nested struct
    get fun getOuter(): Outer {
        return Outer { inner: Inner { value: self.v } };
    }
}
