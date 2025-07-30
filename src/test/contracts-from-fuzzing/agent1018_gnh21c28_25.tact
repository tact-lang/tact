contract LongPrimitives {
    p1: Int;
    p2: Bool;
    p3: Address;
    p4: Slice;
    p5: Cell;
    p6: Builder;
    p7: String;
    p8: Int?;
    p9: Bool?;
    p10: String?;

    init() {
        self.p1=1; self.p2=false; self.p3=myAddress(); self.p4=emptyCell().asSlice();
        self.p5=emptyCell(); self.p6=beginCell(); self.p7="xyz";
        self.p8=null; self.p9=true; self.p10="opt";
    }
}