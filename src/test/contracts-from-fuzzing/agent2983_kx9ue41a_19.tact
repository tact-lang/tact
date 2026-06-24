contract OptionalSlicesCells {
    body: Slice?;
    dataCell: Cell?;

    init() {
        self.body = null;
        self.dataCell = null;
    }
}