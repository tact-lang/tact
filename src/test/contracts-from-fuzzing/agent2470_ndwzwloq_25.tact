struct OptionalCellSlice {
    c: Cell?;
    s: Slice?;
}

contract OptCS {
    data: OptionalCellSlice = OptionalCellSlice{
        c: null,
        s: null,
    };
}