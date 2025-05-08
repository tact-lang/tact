contract A {
    init() { }
    receive() {}
}

contract Test {
    receive() {
         let init_cell = initOf A();
         let code_cell = codeOf A;
    }
}
