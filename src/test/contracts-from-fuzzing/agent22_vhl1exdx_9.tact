contract TestGetterCell {
    c: Cell;

    init() {
         // create a cell with some content
         self.c = beginCell().storeUint(123, 8).endCell();
    }

    receive() {}

    get fun getCell(): Cell {
         return self.c;
    }
}
