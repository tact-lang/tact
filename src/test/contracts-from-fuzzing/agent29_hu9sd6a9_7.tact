contract ManyOptionals {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    qux: Int?;

    init() {
        self.foo = 5;
        self.bar = null;
        self.baz = "hey";
        self.qux = null;
    }
}