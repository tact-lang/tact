contract A {
    receive() {}
}

contract TesterCodeOf {
    receive() {
        let c: Cell = codeOf A;
        let selfCode: Cell = myCode();
    }
}
