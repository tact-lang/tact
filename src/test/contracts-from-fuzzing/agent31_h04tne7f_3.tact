contract B(param: Int) {}

contract TestParams {
    receive() {
         let s: StateInit = initOf B(42);
         let code: Cell = codeOf B;
    }
}
