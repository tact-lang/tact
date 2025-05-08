contract ManyDirect {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Address;
    f: Address?;
    g: String;
    h: String?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;

    init() {
        self.a=1; self.b=true; self.c=null; self.d=null;
        self.e=myAddress(); self.f=null;
        self.g="hello"; self.h=null;
        self.i=emptyCell(); self.j=null;
        self.k=emptyCell().asSlice(); self.l=null;
    }
}
