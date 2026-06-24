contract MixedOptionals {
    foo: Int? = null;
    bar: Bool? = true;
    baz: String? = null;

    init() {
        self.foo = 99;
        self.bar = false;
        self.baz = "hello";
    }
}