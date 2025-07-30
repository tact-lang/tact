contract PersistentSliceBuilder {
    sVal: Slice;
    bVal: Builder;

    init() {
        self.sVal = emptyCell().asSlice();
        self.bVal = beginCell();
    }
}