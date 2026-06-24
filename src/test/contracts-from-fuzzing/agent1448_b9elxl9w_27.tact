contract MixedTypes {
    foo: Int;
    bar: Bool;
    baz: Int?;
    qux: Bool?;

    init() {
        self.foo = 5;
        self.bar = false;
        self.baz = null;
        self.qux = null;
    }
}