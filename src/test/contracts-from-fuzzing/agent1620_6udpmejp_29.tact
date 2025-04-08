contract WeirdOrder {
    b: Bool;
    i: Int;
    s: String;
    b2: Bool?;
    i2: Int?;
    s2: String?;

    init() {
        self.b = false;
        self.i = 3;
        self.s = "zero";
        self.b2 = true;
        self.i2 = 4;
        self.s2 = null;
    }
}