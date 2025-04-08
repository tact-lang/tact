contract ConstDefault {
    foo: Int = 42;
    bar: Bool = true;
    baz: String = "ok";

    init() {
        self.foo = 1;
        self.bar = false;
        self.baz = "no";
    }
}