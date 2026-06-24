// Struct with persistent optional cell and slice fields
struct OptCells {
    c: Cell?;
    s: Slice?;
}

contract OptCellSlice {
    opt: OptCells;

    init() {
        self.opt = OptCells{
            c: null,
            s: null
        };
    }
}