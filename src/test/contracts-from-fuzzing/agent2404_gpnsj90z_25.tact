contract NestedOptions {
    s: String?;
    i: Int?;
    flag: Bool;
    s2: String?;
    i2: Int?;

    init() {
        self.s = null;
        self.i = 42;
        self.flag = true;
        self.s2 = "abc";
        self.i2 = null;
    }
}