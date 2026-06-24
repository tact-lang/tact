contract A {
    init() {
        // Simple initialization for contract A
    }
}

contract B {
    init() {
        // Using initOf to compute the initial state of contract A
        let initA = initOf A();
        // Compute a basechain address using contractAddress()
        let addrA = contractAddress(initA);
    }
}

// A simple receiver to trigger compilation of both contracts
contract Test {
    init() {
        // Instantiate both contracts' initial states
        let _ = initOf A();
        let _ = initOf B();
    }

    receive() {}
}
