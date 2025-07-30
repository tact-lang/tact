contract TestContract {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Int;
    k: Bool;
    l: Int?;

    init() {
        self.a=1; self.b=true; self.c=myAddress(); self.d=emptyCell(); self.e=emptyCell().asSlice();
        self.f="hi"; self.g=null; self.h=null; self.i=null; self.j=2; self.k=false; self.l=null;
    }
}