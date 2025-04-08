contract IntSerializations {
    a: Int as int8;
    b: Int as uint1;
    c: Int as int16;
    d: Int as uint64;
    
    init() {
        self.a = -5;
        self.b = 1;
        self.c = 100;
        self.d = 12345678;
    }
}