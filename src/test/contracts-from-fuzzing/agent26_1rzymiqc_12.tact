asm(-> 1 0) extends mutates fun myLoadRef(self: Slice): Cell { LDREF }

contract TestMutates3 {
    cellVal: Cell;

    init(c: Cell) {
        self.cellVal = c;
    }

    get fun getLoaded(): Cell {
        // Since myLoadRef is declared as an extension function on Slice,
        // call it as a method on the Slice instance
        return self.cellVal.asSlice().myLoadRef();
    }
}
