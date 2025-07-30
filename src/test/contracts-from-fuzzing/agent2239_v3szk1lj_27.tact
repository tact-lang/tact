contract UintSerialization {
    x: Int as uint8;
    y: Int as uint64;

    init() {
        self.x = 5;
        self.y = 123456789;
    }
}