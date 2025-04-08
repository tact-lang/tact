contract Annotations {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;

    init() {
        self.a = 255;
        self.b = -12345;
        self.c = 1000000000;
    }
}