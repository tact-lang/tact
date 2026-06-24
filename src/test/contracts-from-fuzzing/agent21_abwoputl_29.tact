struct OptCellHolder {
    c: Cell?;
}

contract NullableCell {
    data: OptCellHolder;

    init() {
        self.data = OptCellHolder{ c: null };
    }
}
