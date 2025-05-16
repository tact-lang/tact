struct OnlyCell {
    c: Cell;
}

contract CellOnlyStruct {
    data: OnlyCell;

    init() {
        self.data = OnlyCell{ c: emptyCell() };
    }
}