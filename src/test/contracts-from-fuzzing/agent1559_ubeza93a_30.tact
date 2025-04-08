contract SerializeIntOverflow {
    tiny: Int as uint4;

    init() {
        self.tiny = 16; // exceeds 4 bits
    }
}