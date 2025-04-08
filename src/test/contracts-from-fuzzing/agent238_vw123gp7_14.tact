struct CellVariants {
    c: Cell;
    s: Slice;
    b: Builder;
}

contract CellFields {
    data: CellVariants;

    init() {
        self.data = CellVariants{
            c: emptyCell(),
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }
}