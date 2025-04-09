contract A {}

contract Test {
    receive() {
        // valid usage: empty init for contract with no parameters
        let a_init = initOf A();
        let a_code = codeOf A;
    }
}
