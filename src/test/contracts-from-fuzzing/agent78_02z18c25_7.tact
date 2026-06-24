contract Test6 {
    // State variable declared without constant initialization
    c: Cell;

    // Constructor function to initialize state variable
    init() {
        self.c = beginCell().storeUint(255, 8).endCell();
    }

    receive () {}

    // Getter function that returns a Slice derived from the cell
    get fun getSlice(): Slice {
        return self.c.beginParse();
    }
}
