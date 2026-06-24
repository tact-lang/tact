contract ZeroInit {
    foo: Int;
    bar: Bool;
    baz: Int?;

    init() {
        self.foo = 0;
        self.bar = false;
        self.baz = null;
    }
}