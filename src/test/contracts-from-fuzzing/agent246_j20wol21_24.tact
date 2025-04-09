contract SerialEdge {
    a: Int as int8;
    b: Int as uint4;
    c: Int as int257;
    d: Int;
    e: Int? as uint16;

    init() {
        self.a = -100;
        self.b = 10;
        self.c = 12345;
        self.d = -1;
        self.e = null;
    }
}