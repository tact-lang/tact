contract InitAscription {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;

    init() {
        self.a = 5;
        self.b = -10;
        self.c = 255;
    }
}