contract ManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Address;
    f: Cell;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Slice?;
    k: Address?;
    l: Cell?;

    init() {
        self.a=1; self.b=false; self.c="x"; self.d=emptyCell().asSlice(); self.e=myAddress(); self.f=emptyCell();
        self.g=null; self.h=true; self.i=null; self.j=null; self.k=null; self.l=null;
    }
}