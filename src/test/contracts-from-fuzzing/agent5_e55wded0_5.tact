contract B(x: Int) {
    receive() {}
}

contract Test {
    receive() {
         // Valid usage with contract parameters
         let s: StateInit = initOf B(42);
         let c: Cell = codeOf B;
    }
}
