// very long contract field list of optionals and primitives
contract TestContract {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
    e: Bool;
    f: String;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Int;
    k: Bool;
    l: String;
    m: Int?;
    n: Bool?;
    o: String?;
    p: Int;
    q: Bool;
    r: String;
    s: Int?;
    t: Bool?;
    u: String?;
    v: Int;
    w: Bool;
    x: String;
    y: Int?;
    z: Bool?;

    init() {
        self.a=null; self.b=null; self.c=null; self.d=0; self.e=false; self.f="";
        self.g=null; self.h=null; self.i=null; self.j=1; self.k=true; self.l="a";
        self.m=null; self.n=null; self.o=null; self.p=2; self.q=false; self.r="b";
        self.s=null; self.t=null; self.u=null; self.v=3; self.w=true; self.x="c";
        self.y=null; self.z=null;
    }
}