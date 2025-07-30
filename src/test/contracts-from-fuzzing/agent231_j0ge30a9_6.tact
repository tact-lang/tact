contract MultiFieldInitFunc {
    foo: Bool;
    bar: Int;

    init() {
        self.foo = false;
        self.bar = 123456789;
    }
}