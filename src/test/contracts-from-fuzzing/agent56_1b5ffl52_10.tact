contract DefaultSerialization {
    a: Int;          // default int257
    b: Int as int64; // explicitly int64
    c: Int as uint16;// explicitly uint16

    init() {
        self.a = 111;
        self.b = -50;
        self.c = 65000;
    }
}