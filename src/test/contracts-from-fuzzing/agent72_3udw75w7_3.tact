contract Basic {}

contract Test {
    receive() {
        let c: Cell = codeOf Basic;
        let s: StateInit = initOf Basic();
    }
}
