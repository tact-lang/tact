contract A {
    // A simple contract with default init (no parameters)
    receive() {}
}

contract Test {
    receive() {
         // Valid usage: no parameters for contract A
         let i = initOf A();
         let c = codeOf A;
    }
}
