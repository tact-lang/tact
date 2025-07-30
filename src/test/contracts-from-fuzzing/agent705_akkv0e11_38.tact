struct CellStringOpt {
    c: Cell;
    s: String?;
}

contract TestCellStrOpt {
    val: CellStringOpt;

    init() {
        self.val = CellStringOpt { c: emptyCell(), s: null };
    }
}