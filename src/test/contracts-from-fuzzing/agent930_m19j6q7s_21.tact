struct Inner {
    a: Int;
    b: Bool?;
}

contract PersistentOpts {
    foo: Inner;

    init() {
        self.foo = Inner{ a: 0, b: null };
    }
}