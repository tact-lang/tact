// Test minimal contract with a single optional Cell
contract OptionalCellPersist {
    state: Cell? = null;

    init() {
        self.state = emptyCell();
    }
}