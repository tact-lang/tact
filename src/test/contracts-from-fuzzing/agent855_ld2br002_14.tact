contract OptionalFieldsDirect {
    foo: Int?;
    bar: String?;
    flag: Bool?;

    init() {
        self.foo = null;
        self.bar = "set";
        self.flag = null;
    }
}