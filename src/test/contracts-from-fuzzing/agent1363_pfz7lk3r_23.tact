struct CellWrap {
    value: Cell;
}

contract CellWrapStorage {
    val: CellWrap;

    init() {
        self.val = CellWrap{
            value: emptyCell(),
        };
    }
}