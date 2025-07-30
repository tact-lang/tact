// Test ordering of fields with different explicit serializations
contract Test {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int; // default int257
    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
        self.d = -4;
        self.e = 5;
    }
    receive(){ let _=self.e; }
}