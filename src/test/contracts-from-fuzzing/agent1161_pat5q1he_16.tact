contract LargeNumbers {
    a: Int as uint8;
    b: Int as uint64;
    c: Int as int16;
    d: Int as int257;

    init() {
        self.a = 255;
        self.b = 1234567890123456;
        self.c = -32000;
        self.d = -1;
    }
}