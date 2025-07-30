contract A {
    // Simple contract with no state or parameters
    receive() {}
}

contract Test {
    receive() {
         // Valid usage for contract with no parameters: add empty parentheses for initOf
         let a_init = initOf A();
         let a_code = codeOf A;
    }
}
