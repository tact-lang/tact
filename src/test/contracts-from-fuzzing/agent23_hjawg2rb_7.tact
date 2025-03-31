contract Test {
    fun testCells() {
        // Using debug dump on Cell, Builder, and Slice as per documentation 
        dump(emptyCell());  // Expected to show an empty cell
        dump(beginCell());  // Expected to show a builder cell
        dump(emptySlice()); // Expected to show an empty slice
    }

    receive() {
        self.testCells();
    }
}
