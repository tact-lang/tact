contract ManyDefaults {
    foo: Int = 1;
    bar: Bool = false;
    text: String = "hi";

    init() {
        self.foo = 42;
        self.bar = true;
        self.text = "changed";
    }
}