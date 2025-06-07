struct StringAndCells {
    s: String;
    c: Cell;
    sl: Slice;
    optS: String?;
    optC: Cell?;
}

contract StringCellFields {
    payload: StringAndCells;

    init() {
        let cellVal = emptyCell();
        self.payload = StringAndCells{
            s: "abc",
            c: cellVal,
            sl: cellVal.asSlice(),
            optS: null,
            optC: null,
        };
    }
}
