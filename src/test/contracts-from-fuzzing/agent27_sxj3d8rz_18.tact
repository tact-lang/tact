struct SliceInt { s: Slice; val: Int }

// Assembly function using arrangement: push arguments in order s, len -> rearrange to return s and value
asm(s len -> 1 0) fun myLoadInt(len: Int, s: Slice): SliceInt { LDIX }

contract AsmArrangementTest {
    receive() {
        // Create a cell with an int 27 stored in 10 bits
        let b = beginCell().storeInt(27, 10);
        let s = b.endCell().beginParse();
        let si: SliceInt = myLoadInt(10, s);
        // Dump the loaded int value, expecting 27
        dump(si.val);
    }
}
