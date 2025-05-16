struct Extreme {
    i1: Int as int1;
    i257: Int as int257;
    u1: Int as uint1;
    u256: Int as uint256;
}

contract ExtremeSerialization {
    val: Extreme;

    init() {
        self.val = Extreme{
            i1: 0,
            i257: -1,
            u1: 1,
            u256: 1
        };
    }
}