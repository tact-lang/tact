contract SerializationEdgeCase {
    a: Int as uint1; // only 1 bit
    b: Int as int8;
    c: Int as uint4;
    d: Int as int257;

    init() {
        self.a = 1;
        self.b = -128;
        self.c = 15;
        self.d = 0;
    }
}