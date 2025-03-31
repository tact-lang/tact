struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
    s: String;
}

contract TestCompositeGetter {
    state: Outer;

    init() {
        self.state = Outer{ inner: Inner{ a: 99 }, s: "hello" };
    }

    receive() {}

    get fun getComposite(): Outer {
        return self.state;
    }
}
