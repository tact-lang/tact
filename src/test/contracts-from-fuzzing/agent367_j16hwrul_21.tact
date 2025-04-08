// large persistent state using contract fields directly with mixed types
contract ManyVars {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
    k: Bool;
    l: Int?;
    m: String?;

    init() {
        self.a=1;
        self.b=null;
        self.c=true;
        self.d=null;
        self.e="e";
        self.f=null;
        self.g=7;
        self.h=false;
        self.i="i";
        self.j=10;
        self.k=true;
        self.l=null;
        self.m=null;
    }
}