contract OutOfOrder {
    a: Int as uint8;
    b: Int;

    init() {
        self.b = 257;
        self.a = 258;  // out of uint8 range, but this assignment last
        self.a = 255;
    }
}
