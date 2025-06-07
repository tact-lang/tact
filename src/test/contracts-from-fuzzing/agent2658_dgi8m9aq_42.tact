struct WithCell {
    c: Cell;
}

contract CellStructTest {
    w: WithCell;
    
    init() {
        self.w = WithCell{ c: emptyCell() };
    }
}