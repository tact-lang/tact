contract TestContract {
    foo: Int = 1;
    bar: Bool = false;
    baz: String = "hello";

    init() {
        self.foo = 2;
        self.bar = true;
        self.baz = "world";
    }

    receive() {
        self.foo = self.foo + 1;
    }
}