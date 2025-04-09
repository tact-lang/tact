contract A {}

contract Test {
    receive() {
        let s: StateInit = initOf A();
        let c: Cell = codeOf A;
    }
}
