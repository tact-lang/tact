contract BigOptionalMix {
    a: Int?;
    b: Bool?;
    c: Int;
    d: Bool;
    e: Int?;
    f: Bool?;
    g: Int;
    h: Bool;
    i: String?;
    j: String;

    init() {
        self.a=null; self.b=true; self.c=1; self.d=false; self.e=2;
        self.f=null; self.g=3; self.h=true; self.i=null; self.j="hello";
    }
}