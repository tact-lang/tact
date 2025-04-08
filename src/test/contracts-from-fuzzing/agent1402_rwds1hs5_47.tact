contract SerializeBounds {
    a: Int as uint1;
    b: Int as int257;
    c: Int as uint256;
    d: Int as int1;

    init() {
        self.a = 1;
        self.b = -1;
        self.c = 0;
        self.d = 0;
    }
}