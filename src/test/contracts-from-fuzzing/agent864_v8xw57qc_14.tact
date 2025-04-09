contract OptionalsEverywhere {
    b1: Bool?;
    b2: Bool?;
    i1: Int?;
    i2: Int?;
    s1: String?;
    s2: String?;
    init() {
        self.b1 = null;
        self.b2 = true;
        self.i1 = null;
        self.i2 = 5;
        self.s1 = "hi";
        self.s2 = null;
    }
    receive() {
        self.s2 = "bye";
    }
}