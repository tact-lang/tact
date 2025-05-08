contract OptionalSlices {
    slice1: Slice?;
    slice2: Slice?;
    slice3: Slice?;

    init() {
        self.slice1 = null;
        self.slice2 = emptyCell().asSlice();
        self.slice3 = null;
    }
}