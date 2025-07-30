contract DefaultZeroes {
    foo: Int = 0;
    bar: Int?; // default should be null
    baz: Bool = false;
    qux: Bool?; // default should be null

    init() {
        self.foo = 42;
        self.bar = 43;
        self.baz = true;
        self.qux = false;
    }
}