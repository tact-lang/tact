contract LazyInit {
    foo: Int;
    bar: Bool;

    init() {
        self.foo = 10;
        self.bar = true;
    }
}