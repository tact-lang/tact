struct StringCell {
    s: String;
    c: Cell;
}

contract StringCellMix {
    data: StringCell;

    init() {
        self.data = StringCell{
            s: "abc",
            c: emptyCell(),
        };
    }
}