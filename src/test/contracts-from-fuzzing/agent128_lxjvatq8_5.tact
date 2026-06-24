/* Test Case 3: Valid usage of initOf with a contract that has parameters */

contract B {
    init(param: Int) {
        // simple initialization
    }
    receive() {}
}

contract Test {
    receive() {
        let si = initOf B(42);
    }
}
