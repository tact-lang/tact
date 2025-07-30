contract MixPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Builder;
    f: Cell;

    init() {
        self.a=5; self.b=true; self.c="xyz";
        self.d=emptyCell().asSlice();
        self.e=beginCell();
        self.f=emptyCell();
    }
}