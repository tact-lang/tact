struct OptionalCellsFilled {
    c: Cell?;
    s: Slice?;
}

contract OptionalsFilled {
    data: OptionalCellsFilled;

    init() {
        let cellVal = beginCell().storeInt(0, 1).endCell();
        self.data = OptionalCellsFilled{
            c: cellVal,
            s: cellVal.asSlice(),
        };
    }
}