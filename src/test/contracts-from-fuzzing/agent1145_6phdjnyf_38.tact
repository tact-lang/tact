struct EdgeTypes {
    i1: Int as int1;
    i257: Int as int257;
    u1: Int as uint1;
    u256: Int as uint256;
}

contract EdgeTypesTest {
    data: EdgeTypes;

    init() {
        self.data = EdgeTypes{
            i1: 1,
            i257: -5,
            u1: 1,
            u256: 42
        };
    }
}
