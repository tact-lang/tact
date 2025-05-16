struct OptionalSliceCell {
    s: Slice?;
    c: Cell?;
}

contract OptSliceCellField {
    field: OptionalSliceCell = OptionalSliceCell{ s: null, c: null };
}