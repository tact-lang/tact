contract MapCellTest {
    receive() {
        // Test a map with Cell as value type
        let m: map<Int, Cell> = emptyMap();
        // Create a cell that stores a uint value
        let c: Cell = beginCell().storeUint(123, 16).endCell();
        m.set(1, c);
        // Retrieve and parse the cell value from the map
        let fetched: Cell = m.get(1)!!;
        let s: Slice = fetched.beginParse();
        let num: Int = s.loadUint(16);
        dump(num); // Expected output: 123
    }
}
