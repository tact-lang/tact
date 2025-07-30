contract Empty {}

contract TesterEmpty {
    receive() {
         let s: StateInit = initOf Empty();
         let c: Cell = codeOf Empty;
    }
}
