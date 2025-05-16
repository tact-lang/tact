contract TestCell2 {
    receive() {}
    get fun getCell(): Cell {
       return beginCell().storeUint(123, 8).endCell();
    }
}
