// contracts with many fields with optional and primitive mixed
contract TestContract {
    a: Bool; b: Bool?;
    c: Int;  d: Int?;
    e: String; f: String?;
    g: Cell;  h: Cell?;
    i: Slice; j: Slice?;
    k: Address; l: Address?;
    init() {
        self.a=true; self.b=null;
        self.c=123; self.d=null;
        self.e="abc"; self.f=null;
        self.g=emptyCell(); self.h=null;
        self.i=emptyCell().asSlice(); self.j=null;
        self.k=myAddress(); self.l=null;
    }
}