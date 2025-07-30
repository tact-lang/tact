struct OptionalCellHolder {
    c: Cell?;
}

contract OptionalCellPersistent {
    val: OptionalCellHolder;

    init() {
        self.val = OptionalCellHolder {
            c: null
        };
    }
}