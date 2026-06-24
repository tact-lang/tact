contract F {
    receive() {}
}

contract Tester7 {
    receive() {
        let init_cell = initOf F();
        let code_cell = codeOf F;
    }
}
