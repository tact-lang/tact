contract Test {
    // Getter that constructs a Cell at runtime and returns it
    get fun getCell(): Cell {
        let c: Cell = beginCell().storeUint(123, 32).endCell();
        return c;
    }

    receive() {}
}
