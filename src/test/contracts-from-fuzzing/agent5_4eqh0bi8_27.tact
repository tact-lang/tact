contract MapCellTest {
    m: map<Int, Cell> = emptyMap();

    receive() {
        // Insert a cell with a 32-bit unsigned integer value
        self.m.set(1, beginCell().storeUint(123, 32).endCell());
        // Insert another cell
        self.m.set(2, beginCell().storeUint(456, 32).endCell());
        // Overwrite the cell at key 1 with a new value
        self.m.set(1, beginCell().storeUint(789, 32).endCell());
        
        // Retrieve and parse the cell at key 1
        let cell1: Cell? = self.m.get(1);
        let slice1: Slice = cell1!!.beginParse();
        let res1: Int = slice1.loadUint(32);
        dump(res1); // Expected output: 789
        
        // Retrieve and parse the cell at key 2
        let cell2: Cell? = self.m.get(2);
        let slice2: Slice = cell2!!.beginParse();
        let res2: Int = slice2.loadUint(32);
        dump(res2); // Expected output: 456
    }
}
