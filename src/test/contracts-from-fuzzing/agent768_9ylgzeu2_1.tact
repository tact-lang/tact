contract TestContract {
    foo: Int = 1;
    bar: Bool = true;
    baz: String = "hello";

    init() {
        self.foo = 2;
        self.bar = false;
        self.baz = "world";
    }
}
