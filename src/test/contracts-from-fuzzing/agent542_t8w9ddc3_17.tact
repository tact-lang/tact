contract FailSerialize {
    x: Int as uint8;

    init() {
        self.x = 300; // outside 0..255
    }
}