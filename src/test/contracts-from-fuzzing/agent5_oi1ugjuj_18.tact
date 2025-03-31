contract Test {
    receive() {
        // Dump an optional cell with non-null value
        let x: Cell? = emptyCell();
        dump(x);

        // Dump an optional cell with null value
        let y: Cell? = null;
        dump(y);
    }
}
