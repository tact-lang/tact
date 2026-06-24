contract A {
    receive() {}
}

contract TestCode {
    receive() {
        let cell: Cell = codeOf A;
    }
}
