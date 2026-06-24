contract ManySerializations {
    a: Int as uint4;
    b: Int as int4;
    c: Int as uint8;
    d: Int as int8;
    e: Int as coins;
    f: Int as int257;

    init() {
        self.a=1; self.b=-1; self.c=255; self.d=-128; self.e=123456789; self.f=-999;
    }
}