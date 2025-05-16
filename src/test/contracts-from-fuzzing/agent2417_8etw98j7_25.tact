contract ManyDifferentScalars {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;

    init() {
        self.i=42; self.b=true; self.s="x";
        self.a=myAddress(); self.c=emptyCell(); self.sl=emptyCell().asSlice();
    }
}
