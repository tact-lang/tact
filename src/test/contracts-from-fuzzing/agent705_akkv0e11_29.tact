contract DisorderedTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int;

    init() {
        self.a=1; self.b=true; self.c="x"; self.d=emptyCell().asSlice(); self.e=emptyCell(); self.f=myAddress(); self.g=100;
    }
}