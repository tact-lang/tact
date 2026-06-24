struct HasRef {
    refField: Cell;
}

contract CellStorage {
    val: HasRef;

    init() {
        self.val = HasRef{ refField: emptyCell() };
    }

    receive() {
        self.val = HasRef{ refField: emptyCell() };
    }
}