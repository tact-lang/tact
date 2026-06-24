contract IntSerializationEdge {
    tiny: Int as uint1;
    big: Int as int257;

    init() {
        self.tiny = 1;
        self.big = 123456789012345678901234567890;
    }
}