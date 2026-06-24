contract MixedSerializations {
    a: Int as int64;
    b: Int as uint8;
    c: Int as uint32;
    d: Int as coins;
    e: Int;
    f: Int? as int64;
    g: Int? as uint8;
    h: Int? as uint32;
    i: Int? as coins;
    j: Int?;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4; self.e=5;
        self.f=null; self.g=null; self.h=null; self.i=null; self.j=null;
    }
}