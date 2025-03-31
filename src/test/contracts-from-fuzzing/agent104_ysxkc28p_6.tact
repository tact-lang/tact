contract A {
    receive() {}
}

contract Test1 {
    // Valid usage: obtaining init and code cells for contract A with no parameters
    receive() {
        let a_init = initOf A();
        let a_code: Cell = codeOf A;
        // Access a field to force evaluation
        a_init.code;
    }
}
