contract DeeplyMixedPersistence {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Int?;
    i: Bool;
    j: Bool?;
    k: String;
    l: String?;

    init() {
        self.a=1; self.b=null; self.c=true; self.d=null; self.e="a"; self.f=null;
        self.g=2; self.h=3; self.i=false; self.j=true; self.k="b"; self.l="z";
    }
}