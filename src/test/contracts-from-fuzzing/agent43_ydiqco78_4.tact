struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
    y: Bool;
}

contract Test {
    state: Outer = Outer { inner: Inner { x: 100 }, y: false };

    // Getter returning a nested struct
    get fun getOuter(): Outer {
        return self.state;
    }

    receive() {}
}
