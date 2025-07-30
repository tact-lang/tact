struct CellWrap {
    c: Cell;
    v: Int;
}

contract CellHolder {
    wrap: CellWrap;

    init() {
        self.wrap = CellWrap{
            c: emptyCell(),
            v: 123
        };
    }
}