struct CellHolder {
    c: Cell;
}

contract CellAsPersistentField {
    val: CellHolder;

    init() {
        self.val = CellHolder {
            c: "abc".asComment()
        };
    }
}