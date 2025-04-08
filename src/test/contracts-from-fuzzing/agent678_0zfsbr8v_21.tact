contract ManyPrimitiveFields {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: String;
    f: String;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Int;
    k: Bool;
    l: String;

    init() {
        self.a=1; self.b=2; self.c=true; self.d=false;
        self.e="a"; self.f="b"; self.g=null; self.h=null; self.i=null;
        self.j=3; self.k=true; self.l="c";
    }
}