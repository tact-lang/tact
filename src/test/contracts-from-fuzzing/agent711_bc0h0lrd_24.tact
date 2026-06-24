struct SOptionalCell {
    a: Cell?;
    b: Cell;
}

contract OptionalCellStruct {
    data: SOptionalCell;

    init(){
        self.data = SOptionalCell{
            a: null,
            b: emptyCell()
        };
    }
}
