contract OptionalSliceSetInit {
    s: Slice?;

    init() {
        self.s = emptyCell().asSlice();
    }
}