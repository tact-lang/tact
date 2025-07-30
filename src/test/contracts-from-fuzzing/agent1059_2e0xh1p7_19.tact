contract TestContract {
    foo: Int = 42;
    bar: Bool = true;
    baz: String = "hello";

    init() {
        self.foo = 1;
        self.bar = false;
        self.baz = "world";
    }
}