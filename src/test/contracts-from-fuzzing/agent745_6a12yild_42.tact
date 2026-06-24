contract ManySerializations {
    a: Int as int4;
    b: Int as uint4;
    c: Int as int8;
    d: Int as uint8;
    e: Int as int16;
    f: Int as uint16;
    g: Int as int32;
    h: Int as uint32;

    init() {
        self.a=2;
        self.b=2;
        self.c=3;
        self.d=3;
        self.e=4;
        self.f=4;
        self.g=5;
        self.h=5;
    }
}