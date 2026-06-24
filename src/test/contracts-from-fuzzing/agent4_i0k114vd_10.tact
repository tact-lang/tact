contract TestGetterCellFixed {
    receive() {}

    get fun getCell(): Cell {
         return beginCell().endCell();
    }
}
