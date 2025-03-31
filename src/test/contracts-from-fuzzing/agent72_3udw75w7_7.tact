contract WithParam(param: Int) {}

contract Test {
    receive() {
         let s: StateInit = initOf WithParam(42);
         let c: Cell = codeOf WithParam;
    }
}
