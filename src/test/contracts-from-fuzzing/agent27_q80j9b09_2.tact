contract A {
    receive() {}
}

contract Test {
    receive() {
        // Valid use: using initOf with no parameters must include empty parentheses
        let a_init = initOf A();
        // codeOf is used without parentheses
        let a_code = codeOf A;
    }
}
