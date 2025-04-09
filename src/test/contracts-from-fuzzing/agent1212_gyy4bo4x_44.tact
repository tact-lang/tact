contract PrimitiveContract {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: Builder;

    init() {
        self.a=0; self.b=false; self.c=myAddress();
        self.d=emptyCell(); self.e=emptyCell().asSlice(); self.f=beginCell();
    }
}