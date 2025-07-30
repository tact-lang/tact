contract ManySlices {
    s1: Slice;
    s2: Slice;
    init() {
        let c = emptyCell();
        self.s1=c.asSlice();
        self.s2=c.asSlice();
    }
}