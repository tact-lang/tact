contract A {
    receive() {}
}

contract Test {
    get fun test(): Cell {
         return codeOf A;
    }
}
