contract C(param: Int) {}

contract TesterParams {
    receive() {
         let s: StateInit = initOf C(42);
    }
}
