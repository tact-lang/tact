contract LargeMixed {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;

    init() {
        self.a=1; self.b=true; self.c="hi";
        self.d=null; self.e=null; self.f=null;
        self.g=myAddress(); self.h=null;
        self.i=emptyCell(); self.j=null;
        self.k=emptyCell().asSlice(); self.l=null;
    }
}