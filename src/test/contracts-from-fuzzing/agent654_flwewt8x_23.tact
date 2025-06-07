contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Int as uint64;
    e: Int as uint32;
    f: Bool?;
    g: Int?;
    h: String?;
    init() {
        self.a=1; self.b=true; self.c="hello"; self.d=2; self.e=3; self.f=null; self.g=null; self.h=null;
    }
}