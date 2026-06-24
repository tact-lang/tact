// contract with persistent Int fields with explicit serialization types
contract Test {
    a: Int as int128;
    b: Int as uint128;
    c: Int as int8;
    d: Int as uint8;
    e: Int as int257;
    f: Int as uint256;

    init() {
        self.a = -1;
        self.b = 1;
        self.c = -2;
        self.d = 2;
        self.e = -3;
        self.f = 3;
    }
}