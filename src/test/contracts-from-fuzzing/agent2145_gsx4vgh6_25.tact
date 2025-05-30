contract StorageTest {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Address?;
    l: Cell?;
    m: Slice?;
    n: Builder?;

    init() {
        self.a=0;self.b=false;self.c="";self.d=myAddress();self.e=emptyCell();self.f=emptyCell().asSlice();self.g=beginCell();
        self.h = null; self.i = null; self.j=null; self.k=null; self.l=null; self.m=null; self.n=null;
    }
}