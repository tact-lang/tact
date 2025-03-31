contract Test {
    receive() {
        // Dump primitive values
        dump(123);
        dump(true);

        // Dump null value
        dump(null);

        // Dump a cell
        dump(emptyCell());

        // Dump a slice
        dump(emptySlice());

        // Dump a builder
        dump(beginCell());
    }
}
