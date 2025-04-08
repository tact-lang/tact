struct Embedded {
    a: Int as uint8;
    b: Int as int16;
}

struct Container {
    inner: Embedded;
    flag: Bool;
}

contract TestContract {
    s: Container;

    init() {
        self.s = Container {
            inner: Embedded { a: 7, b: -7 },
            flag: false
        };
    }

    receive() {
        dump(self.s.inner.a);
        dump(self.s.inner.b);
        dump(self.s.flag);
    }
}
