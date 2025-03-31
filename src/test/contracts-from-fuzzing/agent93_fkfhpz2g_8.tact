/* Test Case 1: Valid usage of initOf and codeOf expressions with a contract without parameters
   Using a struct to return a pair of cells (code and data from initOf) */

contract A {
    receive() {}
}

struct PairCells {
    cell1: Cell;
    cell2: Cell;
}

contract TestValid {
    receive() {}
    get fun getInitCellsA(): PairCells {
         let st = initOf A();
         return PairCells { cell1: st.code, cell2: st.data };
    }
    
    get fun getCodeA(): Cell {
         return codeOf A;
    }
}
