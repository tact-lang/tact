contract NoDefaults {
    foo: Int;
    bar: String;
    flag: Bool;

    init() {
        self.foo = 10;
        self.bar = "test";
        self.flag = false;
    }
}