// Contract with large number of persistent fields of mixed types
contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;

    init() {
        self.a=1; self.b=false; self.c="c";
        self.d=null; self.e=null; self.f=null;
        self.g=2; self.h=true; self.i="i";
        self.j=3; self.k=false; self.l="l";
    }
}