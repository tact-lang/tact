contract OptionalCellStorage {
    data: Cell?;

    init() {
        self.data = null;
    }
}