// Test Case: Valid usage of codeOf and initOf on a contract with parameters

contract E(param: Int) {
    // No explicit init() allowed because of contract parameters
    receive() {}
}

contract TestE {
    receive() {
        let x: Cell = codeOf E; // should extract the code cell for contract E
        let state = initOf E(42); // should produce the StateInit for contract E with parameter 42
    }
}
