contract SerialOverflow {
    tiny: Int as uint4;

    init() {
        self.tiny = 16; // too big for 4 bits uint
    }
}