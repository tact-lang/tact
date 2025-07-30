contract SerializationEdge {
    small: Int as uint1;
    huge: Int as int257;

    init() {
        self.small = 1;
        self.huge = 123456789123456789;
    }
}