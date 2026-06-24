contract Serializations {
    a: Int as int8;
    b: Int as uint16;
    c: Int as int64;
    d: Int as uint256;
    e: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
    }
}