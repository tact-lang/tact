contract LargeMixed {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Int as uint32;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Address?;
    l: Int as int8;
    m: Bool;
    n: Address;
    o: String;
    init() {
        self.a=1; self.b=true; self.c="c"; self.d=emptyCell(); self.e=myAddress();
        self.f=7; self.g=null; self.h=false; self.i=null; self.j=null; self.k=null;
        self.l=5; self.m=false; self.n=myAddress(); self.o="hey";
    }
}