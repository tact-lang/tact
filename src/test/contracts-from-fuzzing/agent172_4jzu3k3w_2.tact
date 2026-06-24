contract A {
    receive() {}
}

contract Test {
    receive() {
        // Valid usage of initOf with a contract with no parameters
        let init_cell = initOf A();
    }
}
