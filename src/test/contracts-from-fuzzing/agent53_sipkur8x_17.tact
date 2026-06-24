asm(-> 1 0) extends mutates fun myLoadRef(self: Slice): Cell { LDREF }

contract TestLoadRef2 {
    cell: Cell;
    
    init() {
        // Create a cell containing a reference to an empty cell
        self.cell = beginCell().storeRef(beginCell().endCell()).endCell();
    }
    
    receive() {}
    
    fun testLoadRef2(): Cell {
        let s = self.cell.beginParse();
        // Call the assembly extension function as a method on the Slice
        return s.myLoadRef();
    }
}
