contract A {
    receive() {}
}

contract Test {
    receive() {}
    get fun testCode(): Cell {
         return codeOf A;
    }
}
