contract OutOfRange {
    tiny: Int as uint8;
    init() {
        self.tiny = -1;
        self.tiny = 500;
    }
    receive() {}
}