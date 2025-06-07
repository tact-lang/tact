contract SerializeIntKinds {
    a: Int as uint256;
    b: Int as int128;
    c: Int as uint16;
    d: Int as int1;

    init() {
        self.a = 5;
        self.b = -7;
        self.c = 42;
        self.d = 1;
    }
}