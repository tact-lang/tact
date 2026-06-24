// Test Case: Valid usage with a contract with parameters (implicit init)

contract B(param: Int) {
    // No explicit init allowed when using contract parameters
    receive() {}
}

contract TestValidParams {
    init() {
        // Valid: call initOf with an argument matching the contract parameter
        let si = initOf B(99);
        // codeOf returns the code cell of the contract B
        let cc = codeOf B;
    }
    receive() {}
}
