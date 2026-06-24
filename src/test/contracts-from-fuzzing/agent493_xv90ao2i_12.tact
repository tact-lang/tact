contract SerializedInts {
    a: Int as uint8;
    b: Int as uint32;
    c: Int as int64;
    d: Int as int257;

    init() {
        self.a = 1;
        self.b = 100;
        self.c = -1000;
        self.d = 999999;
    }
}