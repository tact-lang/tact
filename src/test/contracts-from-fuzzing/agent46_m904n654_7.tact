contract D(a: Int) {
    receive() {}
}

contract Test5 {
    receive() {
         let s: StateInit = initOf D(5);
         let c: Cell = codeOf D;
    }
}
