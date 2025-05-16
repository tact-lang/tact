contract TestContract {
    aa: Int as uint8;
    bb: Int as int4;
    cc: Int as uint64;

    init() {
        self.aa = 255;
        self.bb = -8;
        self.cc = 0xdeadbeef;
    }
}