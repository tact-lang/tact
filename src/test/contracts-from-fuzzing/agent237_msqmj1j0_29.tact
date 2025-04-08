struct OptCell {
    c: Cell?;
}

contract OptCellTest {
    inner: OptCell;
    init() {
        self.inner = OptCell{c: null};
    }
}