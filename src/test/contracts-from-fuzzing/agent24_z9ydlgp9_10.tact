struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    z: String;
}

contract TestNestedGetter {
    state: Outer = Outer { inner: Inner { x: 99, y: false }, z: "hello" };

    receive() {}

    get fun getNested(): Outer {
        return self.state;
    }
}
