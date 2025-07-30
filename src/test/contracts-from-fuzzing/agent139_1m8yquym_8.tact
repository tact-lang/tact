struct StringsAndCells {
    s1: String;
    c1: Cell;
    s2: String;
    c2: Cell;
}

contract StringCellTest {
    data: StringsAndCells;

    init() {
        self.data = StringsAndCells{
            s1: "one",
            c1: emptyCell(),
            s2: "two",
            c2: emptyCell()
        };
    }
}