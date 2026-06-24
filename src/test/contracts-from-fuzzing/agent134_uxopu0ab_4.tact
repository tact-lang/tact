/* Test Case 2: Using initOf with a contract that has parameters */
contract ParamContract(param: Int) {
    receive() {}
}

contract Test {
    receive() {
        let state = initOf ParamContract(42);
    }
}
