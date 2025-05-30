struct DeepNest {
    a: Int;
    b: Bool?;
    inner: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    dn: DeepNest = DeepNest{a: 7, b: null, inner: Inner{x: 3, y: false}};

    init() {
        self.dn = DeepNest{a: 1, b: true, inner: Inner{x: 42, y: true}};
    }

    receive() {
        dump(self.dn.inner.x);
    }
}