struct OptionalCell {
    c: Cell?;
}

contract OptionalCellContract {
    saved: OptionalCell;

    init() {
        self.saved = OptionalCell{ c: null };
    }
}