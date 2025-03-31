contract C(x: Int) {
    receive() {}
}

contract TestC {
    receive() {
         let init_state = initOf C(321);
         let code_cell = codeOf C;
    }
}
