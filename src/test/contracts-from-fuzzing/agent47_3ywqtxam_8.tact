contract Test4c {
    value: Cell;

    init() {
        self.value = beginCell().endCell();
    }

    receive() {}

    // Getter returning a Cell
    get fun getCell(): Cell {
         return self.value;
    }
}
