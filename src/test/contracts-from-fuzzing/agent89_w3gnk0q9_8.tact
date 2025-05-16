contract TestSlice {
    cellData: Cell;

    // Receiver to ensure the contract is fully compiled
    receive() {}

    init() {
        // Use beginCell (with the correct casing) as per documentation 
        self.cellData = beginCell().storeUint(123, 32).endCell();
    }

    // Getter function that returns a slice of cellData
    get fun getCellSlice(): Slice {
        return self.cellData.beginParse();
    }
}
