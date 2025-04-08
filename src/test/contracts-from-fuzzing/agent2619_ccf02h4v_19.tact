// Long combined mixed contract
contract LongMix {
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
        self.a=1; self.b=true; self.c="a";
        self.d=null; self.e=false; self.f=null;
        self.g=2; self.h=false; self.i="b";
        self.j=3; self.k=null; self.l="c";
    }
}