contract LowBitwidth {
    a: Int as uint4;
    b: Int as uint8;

    init() {
        self.a = 20;  // exceeds uint4 max (15)
        self.b = 300; // exceeds uint8 max (255)
    }
}
