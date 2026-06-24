contract SerializeOutOfRange {
    a: Int as uint8;

    init() {
        self.a = 300; // 300 > 255
    }
}