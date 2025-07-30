contract BoolSerialization {
    b1: Bool;
    b2: Bool;
    num: Int as uint8;

    init() {
        self.b1 = true;
        self.b2 = false;
        self.num = 255;
    }
}
