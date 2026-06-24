contract ManyMixedFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Address?;
    j: Cell?;
    k: Int;
    l: Bool;
    m: String;
    n: Address;
    o: Cell;

    init() {
        self.a=1; self.b=true; self.c="hi"; self.d=myAddress(); self.e=emptyCell();
        self.f=null; self.g=null; self.h=null; self.i=null; self.j=null;
        self.k=2; self.l=false; self.m="bye"; self.n=myAddress(); self.o=emptyCell();
    }
}