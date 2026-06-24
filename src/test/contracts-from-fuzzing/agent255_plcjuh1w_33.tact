struct EdgeInts {
    u1: Int as uint1;
    u256: Int as uint256;
    i1: Int as int1;
    i257: Int as int257;
}

contract SerializationEdges {
    e: EdgeInts;

    init() {
        self.e = EdgeInts{
            u1:1, u256:1, i1:-1, i257:1
        };
    }
}