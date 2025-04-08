contract OrderChaos {
    one: Int;
    two: Bool = true;
    three: Int?;
    four: Bool? = false;
    five: Int = 55;

    init() {
        self.one = 1;
        self.three = null;
        self.four = true;
        self.five = 99;
    }
}