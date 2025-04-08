contract OptionalFieldsDirect {
    foo: Int?;
    bar: Bool?;
    name: String?;

    init() {
        self.foo = null;
        self.bar = true;
        self.name = "abc";
    }
}