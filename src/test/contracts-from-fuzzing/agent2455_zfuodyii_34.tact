contract StringSlices {
    s1: String;
    s2: Slice;
    s3: String?;
    s4: Slice?;

    init() {
        self.s1 = "hello";
        self.s2 = emptyCell().asSlice();
        self.s3 = null;
        self.s4 = null;
    }
}