contract IntSerializationEdge {
    small: Int as uint1;
    large: Int as int257;

    init() {
        self.small = 1;
        self.large = -1;
    }
}