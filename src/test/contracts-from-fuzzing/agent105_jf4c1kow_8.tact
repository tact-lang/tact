// Test 1: Valid usage with a contract that has parameters
contract B(param: Int) {
    receive () {}
}

contract TestValid {
    receive () {
        let s: StateInit = initOf B(42);
        let c: Cell = codeOf B;
    }
}
