struct OptCellSlice {
    c: Cell?;
    s: Slice?;
}

contract OptionalLowLevel {
    data: OptCellSlice;

    init() {
        self.data = OptCellSlice{
            c: null,
            s: null
        };
    }
}