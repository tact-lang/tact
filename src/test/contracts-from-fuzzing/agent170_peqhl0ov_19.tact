contract TestContract {
    foo: Int = 17;
    bar: Bool = true;
    baz: String = "hi";
    qux: Int? = null;
    quux: String? = null;

    init() {
        self.foo = 34;
        self.bar = false;
        self.baz = "hello";
        self.qux = 123;
        self.quux = "bye";
    }

    receive() {
        let _ = self.quux;
    }
}