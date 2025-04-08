contract OnlyNonOpt {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;

    init() {
        self.a=1; self.b=true; self.c="abc"; self.d=emptyCell(); self.e=emptyCell().asSlice();
    }
}