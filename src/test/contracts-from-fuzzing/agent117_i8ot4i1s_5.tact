contract A {
    // Basic contract with no parameters and no init function
    receive() {}
}

contract B {
    receive() {
        // Valid usage: obtain StateInit from contract A
        let a_init = initOf A();
        let a_code = codeOf A;
        // Use the result to avoid unused variable warnings
        a_init.code;
        a_code;
    }
}
