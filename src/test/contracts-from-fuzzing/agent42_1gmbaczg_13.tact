contract TestCellGetter {
    receive() {}

    // Getter returning a Cell type - typically the contract code retrieved using myCode()
    // Note: myCode() is a built-in function that returns the contract's code cell.
    get fun getCode(): Cell {
        return myCode();
    }
}
