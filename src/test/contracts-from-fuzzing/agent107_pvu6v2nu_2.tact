contract A {}

contract B {
    receive() {
        // Basic test: Use initOf with no arguments, and codeOf
        let a_init = initOf A();
        let a_code = codeOf A;
    }
}
