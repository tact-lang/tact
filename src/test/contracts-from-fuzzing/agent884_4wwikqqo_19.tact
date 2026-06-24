contract ComplexSeq {
    a: Int;
    b: Int?;
    c: Bool;
    d: String?;
    e: Cell;
    f: Address?;

    init() {
        self.a=1; self.b=null; self.c=true; self.d=null; self.e=emptyCell(); self.f=null;
    }
}