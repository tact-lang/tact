/* Test Snippet 6: Self-Referential initOf Usage in a Single Contract */

contract SelfRec {
    // In the initialization, the contract computes its own initial state
    init() {
        // Compute the StateInit of SelfRec with no parameters
        let initState = initOf SelfRec();
        // Compute the contract address from the initial state
        let addrFromInit = contractAddress(initState);
        
        // Also compute the runtime address using myAddress()
        let runtimeAddr = myAddress();
        
        // Assert that for the basechain, the addresses match when computed from a fresh initOf
        require(addrFromInit == runtimeAddr, "Self address mismatch");
    }

    receive() {}
}
