// A wide contract storage with dozens of mixed fields
contract WideVariety {
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
    m: Int;
    n: Int?;
    o: Bool;
    p: Bool?;
    q: String;
    r: String?;
    s: Int;
    t: Int?;
    
    init() {
        self.a=1; self.b=null; self.c=true; self.d=false; self.e="x"; self.f=null;
        self.g=2; self.h=3; self.i=false; self.j=null; self.k="y"; self.l="z";
        self.m=5; self.n=null; self.o=false; self.p=true; self.q="q"; self.r=null;
        self.s=7; self.t=8;
    }
}