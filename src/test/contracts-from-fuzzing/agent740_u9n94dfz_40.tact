struct NullableCellAndSlice {
    c: Cell?;
    s: Slice?;
}

contract NullableFields {
    vals: NullableCellAndSlice;
    init() {
        self.vals = NullableCellAndSlice{};
    }
}