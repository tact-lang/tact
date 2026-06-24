contract TestCellFixed {
    receive() {}

    get fun getCell(): Cell {
         return beginCell().endCell();
    }
}
