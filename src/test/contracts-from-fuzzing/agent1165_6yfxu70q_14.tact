contract OverlappingSerialization {
    a: Int as uint64;
    b: Int as int64;

    init() {
        self.a = 1;
        self.b = -1;
    }
}
