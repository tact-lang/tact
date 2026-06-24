contract ComplexTypes {
    a: Int as int64;
    b: Int as uint32;
    c: Int?;
    d: Bool?;
    e: String?;
    f: Address;
    g: Slice;
    h: Cell;

    init() {
        self.a=1; self.b=2; self.c=null; self.d=true; self.e=null;
        self.f=myAddress(); self.g=emptyCell().asSlice(); self.h=emptyCell();
    }
}
