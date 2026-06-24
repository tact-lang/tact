contract SerializationsEdge {
    a: Int as uint4;
    b: Int as int1;
    c: Int as uint256;
    d: Int as int257;

    init() {
        self.a = 5;
        self.b = -1;
        self.c = 12345;
        self.d = -12345;
    }
}