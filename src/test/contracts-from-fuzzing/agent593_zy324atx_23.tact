// Contract with Int fields with minimum and maximum serialization sizes
contract MinMaxSizes {
    a: Int as uint1;
    b: Int as int1;
    c: Int as uint256;
    d: Int as int257;
    init() {
        self.a = 1;
        self.b = -1;
        self.c = 1;
        self.d = -1;
    }
}