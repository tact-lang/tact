contract DifferentIntWidths {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    init() {
        self.a=255;
        self.b=-512;
        self.c=4294967295;
        self.d=-1234567890;
    }
}