contract SerializeEdge {
    a: Int as int8;
    b: Int as int16;
    c: Int as uint8;
    d: Int as uint16;
    e: Int;

    init() {
        self.a = -128;
        self.b = -32768;
        self.c = 0;
        self.d = 0;
        self.e = 0;
    }
}