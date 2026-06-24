contract OptionalTooBig {
    a: Int? as uint4;

    init() {
        self.a = 31; // Above 2^4-1=15
    }
}