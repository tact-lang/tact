contract OptionalMix {
    foo: Int?;
    bar: Bool?;
    baz: Int = 1;
    qux: String = "hey";

    init() {
        self.foo = 99;
        self.bar = false;
        self.baz = 50;
        self.qux = "hi";
    }
}