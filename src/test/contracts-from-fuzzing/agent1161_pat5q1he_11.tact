struct StringsAndCells {
    s1: String;
    s2: String;
    c1: Cell;
    c2: Cell;
}

contract TextAndData {
    content: StringsAndCells;

    init() {
        self.content = StringsAndCells{
            s1: "hello",
            s2: "world",
            c1: emptyCell(),
            c2: emptyCell()
        };
    }
}