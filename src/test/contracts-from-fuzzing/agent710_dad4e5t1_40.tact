contract DeepDefaults {
    foo: Int = 0;
    bar: Bool = false;
    baz: String = "";
    qux: Int? = null;

    init() {
        self.foo = 5;
        self.bar = true;
        self.baz = "abc";
        self.qux = 42;
    }
}