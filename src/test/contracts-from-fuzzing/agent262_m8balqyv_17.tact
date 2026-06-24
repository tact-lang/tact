contract ManySlices {
    s1: Slice; s2: Slice; s3: Slice; s4: Slice; s5: Slice;
    s6: Slice; s7: Slice; s8: Slice; s9: Slice; s10: Slice;

    init() {
        let e = emptyCell().asSlice();
        self.s1=e; self.s2=e; self.s3=e; self.s4=e; self.s5=e;
        self.s6=e; self.s7=e; self.s8=e; self.s9=e; self.s10=e;
    }
}
