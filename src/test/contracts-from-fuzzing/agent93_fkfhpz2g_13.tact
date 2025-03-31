/* Test Case 3: Valid usage with a contract that has an explicit init() function (no parameters) */

contract C {
    var: Int;
    init() {
         self.var = 100;
    }
    receive() {}
}

struct PairCells {
    code: Cell;
    data: Cell;
}

contract TestC {
    receive() {}
    get fun getCInitCells(): PairCells {
         let st = initOf C();
         return PairCells { code: st.code, data: st.data };
    }
    
    get fun getCCode(): Cell {
         return codeOf C;
    }
}
