struct OptionalSliceCell {
    optSlice: Slice?;
    optCell: Cell?;
}

contract Test {
    data: OptionalSliceCell;

    init() {
        self.data = OptionalSliceCell{
            optSlice: null,
            optCell: null
        };
    }
}
