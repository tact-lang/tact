// very long persistent state with mixed types
contract TestContract {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: Int?;
    g: Bool?;
    h: Address?;
    i: Cell?;
    j: Slice?;
    k: Int;
    l: Int;
    m: Bool;
    n: Address;
    o: Cell;
    p: Slice;
    q: Int?;
    r: Bool?;
    s: Address?;
    t: Cell?;
    u: Slice?;

    init() {
        self.a=1; self.b=true; self.c=myAddress(); self.d=emptyCell(); self.e=emptyCell().asSlice();
        self.f=5; self.g=false; self.h=null; self.i=emptyCell(); self.j=null;
        self.k=10; self.l=11; self.m=false; self.n=myAddress(); self.o=emptyCell(); self.p=emptyCell().asSlice();
        self.q=null; self.r=true; self.s=myAddress(); self.t=null; self.u=emptyCell().asSlice();
    }
}