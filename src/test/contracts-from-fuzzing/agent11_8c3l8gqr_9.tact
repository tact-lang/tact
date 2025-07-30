// Fuzz testing on initOf and cross-contract relationships in Tact

// Test 1: Simple usage of initOf within the same contract
contract Simple {
    init() {}
    receive() {
        let s: StateInit = initOf Simple();
        let addr = contractAddress(s);
    }
}

// Test 2: Child contract initialization called from a Parent
contract Child {
    init() {}
}

contract Parent {
    receive() {
        let childInit = initOf Child();
        let childAddr = contractAddress(childInit);
    }
}

// Test 3: Multi-level parent-child-grandchild relationship
contract Grandchild {
    init() {}
}

contract Child2 {
    init() {
         // Child initializes a grandchild
         let initG = initOf Grandchild();
    }
}

contract Parent2 {
    receive() {
         let initC = initOf Child2();
         let initG = initOf Grandchild();
    }
}

// Test 4: Recursive initialization (self-referential initOf)
contract Recursive {
    init() {
         // Recursive call on the same contract
         let selfInit = initOf Recursive();
    }
    receive() {}
}

// Test 5: Circular dependency: Two contracts call each other via initOf
contract A {
    init() {
         // A calls initOf on B
         let bInit = initOf B();
    }
}

contract B {
    init() {
         // B calls initOf on A
         let aInit = initOf A();
    }
}

// Test 6: Consistency test: Two calls to initOf should yield the same address
contract Consistent {
    init() {}
    
    get fun checkConsistency(): Int {
        let s1 = initOf Consistent();
        let s2 = initOf Consistent();
        let addr1 = contractAddress(s1);
        let addr2 = contractAddress(s2);
        // if addresses match, return 1, otherwise 0
        if (addr1 == addr2) { return 1; } else { return 0; }
    }
}

// Test 7: A more complex graph with multiple contracts
contract D {
    init() {}
}

contract C {
    init() {}
}

contract B2 {
    init() {
         let dInit = initOf D();
         let cInit = initOf C();
    }
}

contract A2 {
    init() {
         let bInit = initOf B2();
         let cInit = initOf C();
    }
    
    // Getter to verify self-consistency of initOf and contractAddress
    get fun checkGraph(): Int {
         let initA1 = initOf A2();
         let addr1 = contractAddress(initA1);
         let initA2 = initOf A2();
         let addr2 = contractAddress(initA2);
         if (addr1 == addr2) { return 1; } else { return 0; }
    }
}
