contract A {
    init() {}

    receive() {
        let init_state = initOf A();
        let code_cell = codeOf A;
    }
}
