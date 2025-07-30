contract A {
    receive() {}
}

contract Test1 {
    receive() {
         let c: Cell = codeOf A;
    }
}
