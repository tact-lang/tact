// Comprehensive Fuzz-Testing Cycle: Testing initOf and Cross-Contract Relationships
// --------------------------------------------------------
// 1. Simple Cross-Contract Initialization

contract A {
    init() {}
}

contract B {
    // Getter function obtains the initial state of A and computes its address
    get fun getAAddress(): Address {
        let initA = initOf A();
        return contractAddress(initA);
    }
}

// --------------------------------------------------------
// 2. Multi-Level Parent-Child Relationship

contract Child {
    init() {}
}

contract Parent {
    childAddr: Address;

    init() {
        let initChild = initOf Child();
        self.childAddr = contractAddress(initChild);
    }

    get fun getChildAddr(): Address {
        return self.childAddr;
    }
}

// --------------------------------------------------------
// 3. Recursive Cross-Contract Initialization

contract A2 {
    init() {}
    // A2 retrieves the init package of B2
    get fun getBAddr(): Address {
         let initB = initOf B2();
         return contractAddress(initB);
    }
}

contract B2 {
    init() {}
    // B2 retrieves the init package of A2
    get fun getAAddr(): Address {
         let initA = initOf A2();
         return contractAddress(initA);
    }
}

// --------------------------------------------------------
// 4. Multi-Level Nested Contract Graph

contract Leaf {
    init() {}
}

contract Middle {
    leafAddr: Address;
    
    init() {
        let initLeaf = initOf Leaf();
        self.leafAddr = contractAddress(initLeaf);
    }

    get fun getLeafAddr(): Address {
        return self.leafAddr;
    }
}

contract Root {
    middleAddr: Address;

    init() {
        let initMiddle = initOf Middle();
        self.middleAddr = contractAddress(initMiddle);
    }

    get fun getMiddleAddr(): Address {
        return self.middleAddr;
    }
}

// --------------------------------------------------------
// 5. Cross-Contract Dependencies via Struct Aggregation

contract E {
    init() {}
}

contract F {
    init() {}
}

struct Addresses {
    addrE: Address;
    addrF: Address;
}

contract D {
    // Returns a struct with addresses of contracts E and F
    get fun getAddresses(): Addresses {
        return Addresses{
            addrE: contractAddress(initOf E()),
            addrF: contractAddress(initOf F())
        };
    }
}

// --------------------------------------------------------
// 6. Recursive Self-reference

contract Recursive {
    init() {}
    
    get fun selfLoop(): Address {
         return contractAddress(initOf Recursive());
    }
}

// --------------------------------------------------------
// 7. Parameterized Contract Initialization

contract Param {
    a: Int;

    init(a: Int) {
        self.a = a;
    }

    get fun getA(): Int {
        return self.a;
    }
}

contract Caller {
    // Returns the address of a Param instance initialized with value 5
    get fun getParamAddress(): Address {
        let initPkg = initOf Param(5);
        return contractAddress(initPkg);
    }

    // Returns the supposed parameter value (simulated test)
    get fun getParamValue(): Int {
        // In a real deployed contract, invoking getA() on Param would yield 5
        return 5;
    }
}

// --------------------------------------------------------
// This comprehensive set of tests covers:
//   - Simple cross-contract initialization
//   - Multi-level parent-child relationships
//   - Recursive cross-contract initializations
//   - Complex nested graphs
//   - Aggregation of multiple dependencies
//   - Recursive self-referencing patterns
//   - Parameterized contract initialization
// 
// Documentation references: The behavior of initOf and contractAddress is described in the official docs (see, e.g., initOf in   and cross-contract relationships discussed in  ).

