struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    c: Int;
}

contract TestNestedGetter {
    data: Outer;

    init() {
        self.data = Outer{ inner: Inner{ a: 10, b: false }, c: 20 };
    }

    receive() {}

    get fun getData() : Outer {
        return self.data;
    }
}
