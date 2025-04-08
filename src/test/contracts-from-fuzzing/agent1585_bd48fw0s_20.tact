contract PersistentOrder {
    a: Int = 1;
    b: Bool = true;
    c: Int as uint8 = 255;
    d: String = "abc";
    e: Bool = false;
    f: Int as int16 = -1234;
    g: String = "def";
    h: Int = 999;
    i: Bool = true;
    j: Int as uint4 = 9;

    init() {
        self.a=1; self.b=true; self.c=2; self.d="d";
        self.e=true; self.f=100; self.g="g";
        self.h=42; self.i=false; self.j=3;
    }
}