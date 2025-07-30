contract A {
    receive() {}
}

contract Test {
    receive() {
        let a_code = codeOf A;
        let a_init = initOf A();
    }
}
