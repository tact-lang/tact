struct CellNest {
    inner: Cell;
    opt: Cell?;
}

struct CellWrap {
    x: CellNest;
    y: CellNest;
}

contract CellDeep {
    val: CellWrap;

    init() {
        self.val = CellWrap{
            x: CellNest{ inner: emptyCell(), opt: emptyCell() },
            y: CellNest{ inner: emptyCell(), opt: null }
        };
    }
}