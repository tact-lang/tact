struct StructWithSlices {
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
}

contract CellTypes {
    state: StructWithSlices;
    init() {
        self.state = StructWithSlices{
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            builderField: beginCell()
        };
    }
}