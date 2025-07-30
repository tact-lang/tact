// optional Cell and Slice fields
contract OptCellSlice {
    c: Cell?;
    s: Slice?;

    init() {
        self.c = null;
        self.s = emptyCell().asSlice();
    }
}