contract TestGetterCell2 {
    // Getter that creates and returns a cell at runtime
    get fun getCell(): Cell {
        return beginCell().storeUint(123, 32).endCell();
    }

    // The receive function to ensure full contract compilation
    receive() {}
}
