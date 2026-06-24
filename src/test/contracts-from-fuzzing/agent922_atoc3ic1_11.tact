contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Slice;
    j: Bool;
    k: Int;

    init() {
        self.a=1; self.b=true; self.c="hi"; self.d=emptyCell(); self.e=emptyCell().asSlice();
        self.f=null; self.g=false; self.h=null; self.i=emptyCell().asSlice(); self.j=false; self.k=123;
    }
}