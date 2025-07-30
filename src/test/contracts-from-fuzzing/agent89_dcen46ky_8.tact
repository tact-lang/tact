contract Fuzz8 {
    foo: Int;
    bar: String;
    baz: Int?;
    qux: Bool?;

    init() {
        self.foo = 5;
        self.bar = "hello";
        self.baz = null;
        self.qux = true;
    }
}