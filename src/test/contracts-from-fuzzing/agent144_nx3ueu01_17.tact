contract SerializeBits {
    s4: Int as uint4;
    s51: Int as uint51;
    s120: Int as uint120;

    init() {
        self.s4 = 5;
        self.s51 = 123456789;
        self.s120 = 789123456789;
    }
}
