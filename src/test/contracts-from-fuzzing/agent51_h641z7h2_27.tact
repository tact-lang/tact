contract Defaults {
    foo: Int = 123;
    bar: Bool = false;
    baz: String = "baz";

    init() {
        self.foo = 1000;
        self.bar = true;
        self.baz = "changed";
    }
}