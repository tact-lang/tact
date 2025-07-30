struct CellHolder {
    data: Cell;
    opt: Cell?;
}

contract TestContract {
    c: CellHolder;

    init() {
        self.c = CellHolder{
            data: emptyCell(),
            opt: null
        };
    }
}