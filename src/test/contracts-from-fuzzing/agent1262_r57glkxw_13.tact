contract OptionalInitializations {
    foo: Int?;
    bar: Bool?;
    text: String?;

    init() {
        self.foo = 5;
        self.bar = null;
        self.text = "abc";
    }
}