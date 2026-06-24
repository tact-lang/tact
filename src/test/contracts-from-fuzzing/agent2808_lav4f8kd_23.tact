contract Test {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Cell;
    f6: Address;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Slice?;
    f11: Cell?;
    f12: Address?;
    
    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "t";
        self.f4 = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
        self.f5 = cell("te6cckEBAQEAAgAAAEysuc0=");
        self.f6 = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");
        self.f7 = null;
        self.f8 = null;
        self.f9 = null;
        self.f10 = null;
        self.f11 = null;
        self.f12 = null;
    }
}