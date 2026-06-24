contract C {
    // Simple contract with an empty init
    init() {}
}

contract B {
    // Multi-level: initialize contract C during B's init
    init() {
        let s: StateInit = initOf C();
    }
}

contract P(param: Int) {
    // Parameterized contract: no init() allowed since contract parameters are used
    // Implicit empty init is provided by default
}

contract A {
    // Contract demonstrating various initOf usages including recursive initialization and multi-contract dependencies
    receive() {
        // Simple cross-contract initialization
        let s1: StateInit = initOf B();

        // Initialize a parameterized contract with a literal parameter
        let s2: StateInit = initOf P(123);

        // Recursive initialization: using initOf on itself (edge-case test)
        let s3: StateInit = initOf A();

        // Accessing parts of the StateInit structure
        let codeB: Cell = s1.code;
        let dataP: Cell = s2.data;
    }
}

// Additional contract to test complex cross-contract graphs
contract X {
    receive() {
        // Initialize multiple contracts to simulate a complex dependency graph
        let sB: StateInit = initOf B();
        let sP: StateInit = initOf P(42);
        let sA: StateInit = initOf A();

        // Use the contract addresses of the initial states
        let addrB: Address = contractAddress(sB);
        let addrP: Address = contractAddress(sP);
        let addrA: Address = contractAddress(sA);

        // Usage examples (no actual equality checks here)
        addrB;
        addrP;
        addrA;
    }
}
