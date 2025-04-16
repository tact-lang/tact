contract MixedSerialization {
    a: Int;           // default int257
    b: Int as int64;  // 64-bit signed
    c: Int as uint32; // 32-bit unsigned
    d: Int as coins;  // variable length coin format

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }
}