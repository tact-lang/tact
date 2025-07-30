struct HasCell {
    c: Cell;
    info: String;
}

contract CellContract {
    state: HasCell;

    init() {
        self.state = HasCell{
            c: emptyCell(),
            info: "cell state",
        };
    }
}