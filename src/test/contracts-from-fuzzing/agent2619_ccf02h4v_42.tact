contract LotsOfFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Slice?;

    init() {
        self.a=1; self.b=false; self.c="k"; self.d=emptyCell(); self.e=emptyCell().asSlice();
        self.f=null; self.g=null; self.h=null; self.i=null; self.j=null;
    }
}