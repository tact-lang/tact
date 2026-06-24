contract CellTest {
    fun test(): Int {
        // Build a cell storing the number 42 in 6 bits
        let cellVal: Cell = beginCell()
                              .storeUint(42, 6)
                              .endCell();
        
        // Convert the cell to a slice and load the 6-bit unsigned integer
        let sliceVal: Slice = cellVal.asSlice();
        let loaded: Int = sliceVal.loadUint(6);
        
        // Return the loaded value; expected to be 42
        return loaded;
    }
    
    receive() {
        self.test();
    }
}
