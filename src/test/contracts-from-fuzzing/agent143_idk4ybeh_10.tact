struct WithCellFields {
    data: Cell;
    ptr: Slice;
    builder: Builder;
}

contract CellComposite {
    cdata: WithCellFields;
    init() {
        self.cdata = WithCellFields{
            data: emptyCell(),
            ptr: emptyCell().asSlice(),
            builder: beginCell()
        };
    }
}