struct CellCombo {
    c: Cell;
    s: Slice;
    b: Builder;
}

contract TVMPrimitives {
    tvm: CellCombo;

    init() {
        self.tvm = CellCombo{
            c: emptyCell(),
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }

    receive() {
        self.tvm = self.tvm;
    }
}