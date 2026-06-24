contract BigPacked {
    f1: Int;
    f2: Bool;
    f3: Int as uint8;
    f4: Int as int16;
    f5: Int as uint32;
    f6: Int;
    f7: Bool;
    f8: Bool;
    f9: Bool;
    f10: Bool;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = 255;
        self.f4 = -32000;
        self.f5 = 4294967295;
        self.f6 = 123456789;
        self.f7 = false;
        self.f8 = true;
        self.f9 = false;
        self.f10 = true;
    }
}