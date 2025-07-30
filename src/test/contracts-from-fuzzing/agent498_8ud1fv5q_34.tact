contract MixedSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint4;
    d: Int as int1;
    e: Int as uint1;
    init() {
        self.a=0; self.b=0; self.c=0; self.d=0; self.e=0;
    }
}