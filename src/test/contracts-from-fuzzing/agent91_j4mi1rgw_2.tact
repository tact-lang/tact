contract A {
    receive() {}
}

contract Test {
    receive() {
         // Valid usage of initOf and codeOf with a contract that has no init parameters
         let initA = initOf A();
         let codeA = codeOf A;
    }
}
