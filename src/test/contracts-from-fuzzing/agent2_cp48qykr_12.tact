struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    c: Int;
}

contract TestDeepComposite {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{
                a: 10,
                b: true
            },
            c: 20
        };
    }

    receive() {}

    get fun getState(): Outer {
        return self.state;
    }
}
