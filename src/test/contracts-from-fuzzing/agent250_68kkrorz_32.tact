contract OnlySliceFields {
    a: Slice;
    b: Slice;

    init() {
        self.a = "hi".asSlice();
        self.b = "there".asSlice();
    }
}