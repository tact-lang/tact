/// Test Case D: Valid usage with contract parameters (no explicit init function)
contract ParamContract(param: Int) {}

contract Caller {
    receive() {
        let pkg = initOf ParamContract(42);
        let code = codeOf ParamContract;
    }
}
