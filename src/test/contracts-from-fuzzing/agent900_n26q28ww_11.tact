contract Defaulted {
    foo: Int = 42;
    bar: Bool = false;
    baz: Int? = null;
    qux: Bool? = true;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = 100;
        self.qux = null;
    }

    receive() {
        self.foo += 10;
    }
}