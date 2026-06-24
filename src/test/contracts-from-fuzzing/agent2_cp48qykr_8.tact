contract TestReturnCell {
    data: Cell;

    init() {
        self.data = emptyCell();
    }

    receive() {}

    get fun getData(): Cell {
        return self.data;
    }
}
