contract InitOrder {
    foo: Int = 10;
    bar: Int;
    baz: Int = 5;

    init() {
        self.bar = 42;
        self.baz = 7;
    }
}