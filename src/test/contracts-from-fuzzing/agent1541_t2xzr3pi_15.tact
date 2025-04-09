contract IntSerializations {
    a: Int as int64 = 1;
    b: Int as uint32 = 2;
    c: Int as int8 = 3;
    d: Int as uint1 = 1;

    init() {
        self.a = -64;
        self.b = 100;
        self.c = -5;
        self.d = 0;
    }

    receive() {
        self.b = self.b + 1;
    }
}