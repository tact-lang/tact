contract A {
    receive() {
        let c: Cell = codeOf A;
        let s: StateInit = initOf A();
    }
}
