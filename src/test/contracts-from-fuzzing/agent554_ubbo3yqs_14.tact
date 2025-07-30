contract ManyPrimitiveVariants {
    a: Int as uint1;
    b: Int as int2;
    c: Int as uint3;
    d: Int as int4;
    e: Int as uint5;
    f: Int as int6;
    g: Int as uint7;
    h: Int as int8;
    i: Bool;
    j: String;
    k: Address;
    l: Cell;
    m: Slice;
    n: String?;
    o: Bool?;

    init() {
        self.a=1; self.b=-1; self.c=7; self.d=-6; self.e=31; self.f=-32;
        self.g=127; self.h=-128; self.i=true; self.j="x"; self.k=myAddress();
        self.l=emptyCell(); self.m=emptyCell().asSlice(); self.n=null; self.o=null;
    }
}