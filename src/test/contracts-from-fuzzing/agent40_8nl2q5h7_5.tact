// Additional edge-case tests for initOf usage in various contexts

contract Another {
    init() {}
}

// TestLocal uses initOf inside a receive() function
contract TestLocal {
    receive() {
        let s: StateInit = initOf Another();
        let a: Address = contractAddress(s);
    }
}

// Free function using initOf outside any contract
fun testFree(): Address {
    return contractAddress(initOf Another());
}
