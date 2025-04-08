struct OptionalCells {
    c: Cell?;
    s: Slice?;
}

contract OptionalsCellSlice {
    data: OptionalCells;

    init() {
        self.data = OptionalCells{
            c: null,
            s: null,
        };
    }
}