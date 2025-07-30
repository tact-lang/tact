contract OnlyDefaults {
    foo: Int = 0;
    bar: Bool = false;
    baz: String = "";

    init() {
        self.foo = 100;
        self.bar = true;
        self.baz = "Filled";
    }
}