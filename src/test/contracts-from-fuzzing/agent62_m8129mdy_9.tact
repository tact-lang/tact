contract GetterTestCell {
    receive() {}

    get fun getCell(): Cell {
         return beginCell().storeUint(123, 32).endCell();
    }
}
