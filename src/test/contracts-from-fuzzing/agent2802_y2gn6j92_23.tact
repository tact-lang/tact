contract OptionalCellSlice {
    a: Cell? = null;
    b: Slice? = null;

    init() {
        self.a = beginCell().endCell();
        self.b = beginCell().endCell().asSlice();
    }
}