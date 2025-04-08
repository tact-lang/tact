struct CellHolder {
    c: Cell;
}

struct NestedCellHolder {
    inner: CellHolder;
}

contract NestedCellStorage {
    data: NestedCellHolder;

    init() {
        self.data = NestedCellHolder{
            inner: CellHolder{
                c: emptyCell(),
            },
        };
    }
}
