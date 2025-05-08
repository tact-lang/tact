/* Test 4: Complex nested initOf with multiple contracts, fixed zero address comparison */

contract C {
    init() {
        // Simple initialization for C
    }
}

contract D {
    init() {
        // Simple initialization for D
    }
}

contract B {
    init() {
        // B depends on C
        let sC = initOf C();
        // Check that C's address is non-zero by comparing with newAddress(0, 0)
        require(contractAddress(sC) != newAddress(0, 0), "C address should be non-zero");
    }
}

contract A {
    receive() {
        // A references both B and D
        let sB = initOf B();
        let sD = initOf D();
        // Enforce that addresses for B and D are different
        require(contractAddress(sB) != contractAddress(sD), "B and D should have different addresses");
    }
}
