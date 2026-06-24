contract OptionalFields {
    foo: Int?;
    bar: String?;
    flag: Bool?;
    init() {
        self.foo = null;
        self.bar = null;
        self.flag = null;
    }
}
