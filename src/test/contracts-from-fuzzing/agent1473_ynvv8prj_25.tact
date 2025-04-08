contract TestContract {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;
    e: Int as uint32;
    f: Int as int32;

    init() {
        self.a=1; self.b=-1; self.c=2; self.d=-2; self.e=3; self.f=-3;
    }
}