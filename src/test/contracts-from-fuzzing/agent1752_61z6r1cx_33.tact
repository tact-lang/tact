contract IntSerializationEdge {
    a: Int as uint4;
    b: Int as int4;
    c: Int as uint12;
    d: Int as int12;

    init() {
        self.a = 15;
        self.b = -8;
        self.c = 4095;
        self.d = -2048;
    }
}