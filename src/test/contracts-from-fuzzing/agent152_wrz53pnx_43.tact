contract SignedEdge {
    a: Int as int8;

    init() {
        self.a = -129; // below signed int8 range
    }
}
