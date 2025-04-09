contract SerialEdge {
    v1: Int as coins;
    v2: Int as uint120;
    v3: Int as int1;

    init() {
        self.v1 = ton("0.5");
        self.v2 = 123456789012345678901234567890;
        self.v3 = -1;
    }
}