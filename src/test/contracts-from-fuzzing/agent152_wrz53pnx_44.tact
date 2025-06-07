contract SignedEdgeHi {
    a: Int as int8;

    init() {
        self.a = 128; // above signed int8 hi range
    }
}
