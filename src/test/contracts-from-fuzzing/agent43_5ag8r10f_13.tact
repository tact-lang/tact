contract Serializations {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint4;

    init() {
        self.a = 255;
        self.b = -32000;
        self.c = 12;
    }
}