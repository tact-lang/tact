// Test Case 1: Valid usage with a contract that has explicit empty init
contract A {
    receive() {}
    init() {}
}

contract Test {
    receive() {
         let s: StateInit = initOf A();
         let c: Cell = codeOf A;
    }
}
