contract A {}

contract Test {
    receive() {
        // Test using initOf for a contract with no explicit functions
        let s: StateInit = initOf A();
    }
}
