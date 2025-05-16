contract Simple {
    receive() {}
}

contract Tester {
    // Getter function testing valid initOf and codeOf usage
    get fun test(): Cell {
         let s: StateInit = initOf Simple();
         let c: Cell = codeOf Simple;
         // Return the cell obtained from codeOf to use the expressions
         return c;
    }

    receive() {}
}
