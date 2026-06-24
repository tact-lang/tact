// Testing optional Cell and optional Slice fields
contract OptionalCellSlice {
    optC: Cell?;
    optS: Slice?;

    init() {
        self.optC = null;
        self.optS = null;
    }
}