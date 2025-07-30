contract TinyEdge {
    x: Int as uint4;

    init() {
        self.x = -1;  // out of range but allowed at runtime
        self.x = 15;  // upper edge of uint4
        // at end of compute phase no error expected
    }
}