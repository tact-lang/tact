contract SerializationEdge {
    small: Int as uint4;
    negative: Int;

    init() {
        self.small = 15;
        self.negative = -42;
    }
}