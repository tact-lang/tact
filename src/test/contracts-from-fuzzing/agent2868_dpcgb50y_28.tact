contract IntSerializationEdge {
    tooBig: Int as uint8;

    init() {
        self.tooBig = 300; // should fail only post-compute phase
    }
}