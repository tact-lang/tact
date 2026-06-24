contract ManyPrimitiveFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int as int64;
    h: Int as uint64;
    i: Int as int8;
    j: Int as uint8;

    init() {
        self.a=1; self.b=true; self.c="text"; self.d=emptyCell();
        self.e=emptyCell().asSlice(); self.f=myAddress();
        self.g=100; self.h=200; self.i=5; self.j=5;
    }
}