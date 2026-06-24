struct BoolAndCell {
    flag: Bool;
    cellVal: Cell;
}

contract BoolCellStruct {
    data: BoolAndCell;

    init() {
        self.data = BoolAndCell{
            flag: false,
            cellVal: emptyCell(),
        };
    }
}