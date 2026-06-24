contract A {
    receive() {}
}

contract Tester1 {
    receive() {
        let init_cell = initOf A();
        let code_cell = codeOf A;
    }
}
