contract A {
    receive() {}
}

contract Test {
    receive() {}
    get fun getCodeA(): Cell {
         return codeOf A;
    }
}
