/// Test case: Valid usage with a contract having contract parameters
contract ParamContract(val: Int) {
    // Using contract parameters implies no explicit init() is allowed
    receive() {}
}

contract TesterParam {
    receive() {
         let s: StateInit = initOf ParamContract(100);
         let c: Cell = codeOf ParamContract;
    }
}
