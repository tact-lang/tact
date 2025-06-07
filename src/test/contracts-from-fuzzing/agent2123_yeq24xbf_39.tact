contract ManySlices {
    s1: Slice;
    s2: Slice;
    s3: Slice;
    s4: Slice;

    init() {
        self.s1 = emptyCell().asSlice();
        self.s2 = emptyCell().asSlice();
        self.s3 = emptyCell().asSlice();
        self.s4 = emptyCell().asSlice();
    }
}