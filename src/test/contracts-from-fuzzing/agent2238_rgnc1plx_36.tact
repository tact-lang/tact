// Test mixed serialization sizes in one contract
contract TestContract {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
    e: Int as int64;
    f: Int as int32;
    g: Int;
    h: Bool;
    s: String;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4; self.e=5; self.f=6; self.g=7; self.h=true; self.s="x";
    }
}
