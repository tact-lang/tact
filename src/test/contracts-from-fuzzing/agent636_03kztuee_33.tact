struct RemainingCellStruct {
    a: Int;
    rest: Cell as remaining;
}

contract RemainingCellPersistent {
    data: RemainingCellStruct;

    init() {
        self.data = RemainingCellStruct{ a:5, rest: emptyCell() };
    }
}
