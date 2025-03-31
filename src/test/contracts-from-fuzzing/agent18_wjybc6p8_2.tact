contract A {
    receive() {}
}

contract Test {
    receive() {
        let a_init = initOf A();
        let a_code = codeOf A;
    }
}
