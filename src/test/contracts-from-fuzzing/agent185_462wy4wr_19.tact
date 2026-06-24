struct HasCell {
    payload: Cell;
}

contract CellFieldContract {
    data: HasCell;

    init() {
        self.data = HasCell{
            payload: emptyCell()
        };
    }
}