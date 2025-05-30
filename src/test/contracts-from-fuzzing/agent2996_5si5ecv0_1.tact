contract SimpleNested {
    foo: Int;
    bar: Inner;

    init() {
        self.foo = 7;
        self.bar = Inner{ x: 1, y: 2 };
    }
}

struct Inner {
    x: Int;
    y: Int;
}