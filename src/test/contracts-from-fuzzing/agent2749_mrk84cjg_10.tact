contract OptionalsAndNested {
    s1: String?;
    s2: String;
    i1: Int?;
    i2: Int;

    init() {
        self.s1 = null;
        self.s2 = "hello";
        self.i1 = null;
        self.i2 = 42;
    }
}