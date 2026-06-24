struct IntSerializationsMax {
    u1: Int as uint1;
    u256: Int as uint256;
    i1: Int as int1;
    i257: Int as int257;
}

contract IntSerializationsMaxTest {
    data: IntSerializationsMax;

    init() {
        self.data = IntSerializationsMax{
            u1:1,
            u256:100,
            i1:0,
            i257:-50
        };
    }
}
