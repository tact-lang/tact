contract DefaultsInit {
    foo: Int = 10;
    bar: String = "hello";
    baz: Bool = true;
    qux: Int?; // no explicit default, should be null

    init() {
        self.foo = 20;
        self.bar = "world";
        self.baz = false;
        self.qux = 30;
    }
}