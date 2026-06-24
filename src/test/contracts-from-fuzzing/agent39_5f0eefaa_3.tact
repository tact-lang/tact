/* Test 2: Valid usage with contract parameters */
contract B(param: Int) {
    receive() {}
}

contract Test {
    receive() {
        let initCell = initOf B(42);
        let codeCell = codeOf B;
    }
}
