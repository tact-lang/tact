contract TooBigSerialization {
    a: Int as uint4;

    init() {
        self.a = 31; // Larger than 2^4-1=15
    }
}