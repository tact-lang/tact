contract OptionalFields {
    foo: Int?;
    bar: Bool?;
    text: String?;

    init() {
        self.foo = 4;
        self.bar = null;
        self.text = "hello";
    }
}
