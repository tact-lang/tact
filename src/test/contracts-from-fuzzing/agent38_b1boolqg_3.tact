contract TestNoInit {}

contract TestUse {
    receive() {
        let pkg: StateInit = initOf TestNoInit();
        let code: Cell = codeOf TestNoInit;
    }
}
