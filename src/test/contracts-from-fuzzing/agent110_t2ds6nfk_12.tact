contract DefaultOpts {
    foo: Int?;
    bar: String = "hello";
    flag: Bool?;

    init() {
        self.foo = null;
        self.flag = null;
    }
}