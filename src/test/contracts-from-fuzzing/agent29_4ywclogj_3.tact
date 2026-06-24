/* Test Snippet: Multi-Level Cross-Contract Initialization using initOf */

// A simple contract with an initialization parameter
contract Child {
    // The init function initializes with a parameter x (of type Int)
    init(x: Int) {}
    
    // An empty receive to simulate a deployed contract
    receive() {}
}

// A contract that initializes a Child contract and stores its address
contract Parent {
    // Persistent field to store the address of a Child contract created via initOf
    childAddr: Address;
    
    init() {
        // Compute the initial StateInit of Child with parameter 10
        let childInit = initOf Child(10);
        // Compute and store the contract address for this Child contract
        self.childAddr = contractAddress(childInit);
    }
    
    receive() {}
}

// A contract at a higher level that references Parent's initialization
contract GrandParent {
    // Persistent field to store the address of a Parent contract created via initOf
    parentAddr: Address;
    
    init() {
        // Compute the initial StateInit of Parent with no parameters
        let parentInit = initOf Parent();
        // Compute and store the contract address for the Parent contract
        self.parentAddr = contractAddress(parentInit);
    }
    
    // In a receive function, we check that the stored address matches
    receive() {
        let computedParentAddr = contractAddress(initOf Parent());
        // Assert that the computed parent's contract address is the same as the stored one
        require(self.parentAddr == computedParentAddr, "Parent address mismatch");
    }
}
