struct Extremes {
    minInt: Int as int1;
    minUInt: Int as uint1;
    maxInt: Int as int257;
    maxUInt: Int as uint256;
}

contract IntEdgesTest {
    x: Extremes;

    init() {
        self.x = Extremes{
            minInt: 0,
            minUInt: 1,
            maxInt: 0,
            maxUInt: 0,
        };
    }
}