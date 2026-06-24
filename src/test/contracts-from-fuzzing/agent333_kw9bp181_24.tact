contract TestContract {
    a: Int as uint8 = 0;
    b: Int as int16 = 0;
    c: Int as uint32 = 0;
    d: Int as int257 = 0;

    init() {
        self.a = 255;
        self.b = -32768;
        self.c = 4294967295;
        self.d = 123456789012345;
    }
}