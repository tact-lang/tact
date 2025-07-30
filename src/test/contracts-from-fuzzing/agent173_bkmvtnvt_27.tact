contract SliceOpt {
    s: Slice?;

    init() {
        self.s = "hello".asComment().asSlice();
    }
}