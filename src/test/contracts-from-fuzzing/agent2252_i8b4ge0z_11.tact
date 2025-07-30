contract DifferentSerializations {
    a: Int as int8;
    b: Int as uint64;
    c: Int as int257;
    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
    }
}