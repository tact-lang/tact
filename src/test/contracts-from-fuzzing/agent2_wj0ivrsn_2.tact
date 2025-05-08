contract A {
    receive() {}
}

contract B {
    receive() {
        // Correct usage: initOf requires empty parentheses for contracts with no init parameters
        let init_cell = initOf A();
        // codeOf is used without parentheses
        let code_cell = codeOf A;
    }
}
