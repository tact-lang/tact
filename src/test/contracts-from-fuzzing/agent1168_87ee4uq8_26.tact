contract PersistentSlices {
    slice1: Slice;
    slice2: Slice?;

    init() {
        let c: Cell = emptyCell();
        self.slice1 = c.asSlice();
        self.slice2 = null;
    }
}