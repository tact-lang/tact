contract OutOfRangeAssign {
    v: Int as uint8;

    init() {
        self.v = 300; // >255
    }
}