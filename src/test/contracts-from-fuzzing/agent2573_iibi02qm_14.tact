contract IntSerializationEdge {
    i1: Int as int1;
    u1: Int as uint1;
    i257: Int as int257;
    u256: Int as uint256;

    init() {
        self.i1 = 0;
        self.u1 = 1;
        self.i257 = -123456789;
        self.u256 = 123456789;
    }
}