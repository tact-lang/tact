contract ManyIntTypes {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
    g: Int as int64;
    h: Int as uint64;
    i: Int; // default 257 bits
    
    init() {
        self.a = -1;
        self.b = 255;
        self.c = -100;
        self.d = 65535;
        self.e = -100000;
        self.f = 4000000000;
        self.g = -5000000000;
        self.h = 100000000000;
        self.i = 0;
    }
}
