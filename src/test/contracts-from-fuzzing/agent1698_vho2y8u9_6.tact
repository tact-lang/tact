contract VariedSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;
    d: Int;  // default int257

    init() {
        self.a = 100;
        self.b = -32000;
        self.c = ton("1");
        self.d = 42;
    }
}