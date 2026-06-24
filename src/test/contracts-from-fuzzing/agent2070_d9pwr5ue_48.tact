contract ManySlices {
    s1: Slice;
    s2: Slice;
    s3: Slice;

    init() {
        let c = beginCell().endCell().asSlice();
        self.s1 = c;
        self.s2 = c;
        self.s3 = c;
    }
}