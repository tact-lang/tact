struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    c: Int;
}

contract TestNested {
    state: Outer;

    init() {
        self.state = Outer{ inner: Inner{ a: 10, b: true }, c: 20 };
    }

    // Getter that returns a nested composite structure
    get fun getNested(): Outer {
        return self.state;
    }

    receive() {}
}
