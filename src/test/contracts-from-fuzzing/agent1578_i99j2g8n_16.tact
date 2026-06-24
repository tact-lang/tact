struct HasCell {
    c1: Cell;
    c2: Cell;
}

contract TestContract {
    val: HasCell;

    init() {
        let c = emptyCell();
        self.val = HasCell{ c1: c, c2: c };
    }
}