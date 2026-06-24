/* Test Case 2: Valid usage with a contract with parameters */

contract B(x: Int) {
    receive() {}
}

struct PairCells {
    one: Cell;
    two: Cell;
}

contract TestParamsValid {
    receive() {}
    get fun getInitB(): PairCells {
         let st = initOf B(42);
         return PairCells { one: st.code, two: st.data };
    }
    
    get fun getCodeB(): Cell {
         return codeOf B;
    }
}
