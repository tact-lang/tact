contract OptionalCellSlice {
    payload: Cell?;
    view: Slice?;

    init() {
        self.payload = null;
        self.view = null;
    }
}