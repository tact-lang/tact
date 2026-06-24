struct Inner {
    a: Int;
    b: Bool;
}

struct Deep {
    inner: Inner;
    value: Int;
}

contract TestDeep {
    state: Deep;

    init() {
        self.state = Deep{
            inner: Inner{ a: 1, b: false },
            value: 42
        };
    }

    receive () {}

    get fun getDeep(): Deep {
        return self.state;
    }
}
