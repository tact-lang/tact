contract LongPrimitiveFields {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    s1: String;
    s2: String;
    a1: Address;
    a2: Address;
    c1: Cell;
    c2: Cell;
    sl1: Slice;
    sl2: Slice;
    bl1: Builder;
    bl2: Builder;

    init() {
        self.i1=1; self.i2=2; self.i3=3; self.i4=4; self.i5=5;
        self.b1=true; self.b2=false; self.b3=true;
        self.s1="one"; self.s2="two";
        self.a1=myAddress(); self.a2=myAddress();
        self.c1=emptyCell(); self.c2=emptyCell();
        self.sl1=self.c1.asSlice(); self.sl2=self.c2.asSlice();
        self.bl1=beginCell(); self.bl2=beginCell();
    }
}