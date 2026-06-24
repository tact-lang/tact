contract Test {
    receive() {
        dump(emptyCell());  // Testing cell type
        dump(beginCell());  // Testing builder type
        dump(emptySlice()); // Testing slice type
    }
}
