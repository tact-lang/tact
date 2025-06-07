// test exotic integer serialization sizes in contract storage
contract WeirdInts {
    a: Int as uint1;   // 1 bit unsigned
    b: Int as int2;   // 2 bit signed
    c: Int as uint17; // 17 bit unsigned
    d: Int as int51;  // 51 bit signed
    e: Int as uint101; // 101 bit unsigned
    f: Int as int256; // 256 bit signed
    init() {
        self.a=1; self.b=1; self.c=1; self.d=1; self.e=1; self.f=1;
    }
}