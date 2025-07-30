contract LargeOrderTest {
    a: Int;
    b: Bool;
    c: String;
    d: Int as uint64;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int as int32;

    init() {
        self.a=1; self.b=true; self.c="abc"; self.d=100;
        self.e=null; self.f=null;
        self.g=2; self.h=false; self.i="xyz"; self.j=50;
    }
}