asm fun keccak256(s: Slice): Int { ONE HASHEXT_KECCAK256 }

contract TestHash {
    cell: Cell;

    init() {
        self.cell = beginCell().storeUint(42, 8).endCell();
    }

    receive() {}
    
    fun getHash(): Int {
        let s = self.cell.beginParse();
        return keccak256(s);
    }
}
