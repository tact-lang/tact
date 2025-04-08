contract IntSerializationEdges {
    u1: Int as uint1;
    i1: Int as int1;
    u256: Int as uint256;
    i257: Int as int257;

    init() {
        self.u1 = 1;
        self.i1 = -1;
        self.u256 = 1;
        self.i257 = -1;
    }
}