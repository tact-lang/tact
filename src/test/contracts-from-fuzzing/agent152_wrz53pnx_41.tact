contract OutOfRange {
    a: Int as uint8;

    init() {
        self.a = 257; // out of range for uint8
    }
}
