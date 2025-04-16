// Very large contract with many primitive fields
contract HugePrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int;
    h: Bool;
    i: String;
    j: Address;
    k: Cell;
    l: Slice;
    m: Int;
    n: Bool;
    o: String;
    p: Cell;
    q: Slice;
    r: Address;
    s: Int;
    t: Bool;
    u: String;
    v: Address;
    w: Cell;
    x: Slice;
    y: Int;
    z: Bool;

    init() {
        self.a=1;self.b=true;self.c="";self.d=emptyCell();self.e=emptyCell().asSlice();
        self.f=myAddress();self.g=1;self.h=true;self.i="";self.j=myAddress();
        self.k=emptyCell();self.l=emptyCell().asSlice();self.m=1;self.n=true;self.o="";
        self.p=emptyCell();self.q=emptyCell().asSlice();self.r=myAddress();self.s=1;
        self.t=true;self.u="";self.v=myAddress();self.w=emptyCell();self.x=emptyCell().asSlice();
        self.y=1;self.z=true;
    }
}