/* Test 2: Multi-level contract dependencies via initOf */

contract C {
    init() {
        // Simple contract C
    }
}

contract B {
    init() {
        // During initialization of B, compute initOf C to create a dependency
        let s = initOf C();
        // We don't use s further, just to register dependency
    }
}

contract A {
    receive() {
        // Get the StateInit of B and C
        let sB = initOf B();
        let addrB = contractAddress(sB);
        let sC = initOf C();
        let addrC = contractAddress(sC);
        // The addresses must be different since B and C are different contracts
        require(addrB != addrC, "B and C should have distinct addresses");
    }
}
