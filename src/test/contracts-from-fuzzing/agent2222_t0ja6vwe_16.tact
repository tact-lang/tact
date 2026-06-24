contract NestedStructs {
    s1: Int;
    s2: String;
    s3: Bool;
    s4: Cell;
    s5: Slice;
    s6: Address;
    s7: Int?;
    s8: String?;
    s9: Bool?;
    s10: Cell?;
    s11: Slice?;
    s12: Address?;

    init() {
        self.s1=1; self.s2="x"; self.s3=true; self.s4=emptyCell(); self.s5=emptyCell().asSlice();
        self.s6=myAddress(); self.s7=null; self.s8=null; self.s9=null; self.s10=null; self.s11=null; self.s12=null;
    }
}