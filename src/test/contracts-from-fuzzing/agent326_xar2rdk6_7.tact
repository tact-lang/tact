contract OptionalsVsDefaults {
    foo: Int?;
    bar: Int = 0;
    flag: Bool?;
    flag2: Bool = false;

    init() {
        self.foo = null;
        self.flag = null;
    }

    receive() {
        self.foo = 5;
    }
}