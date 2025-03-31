// Simple cross-contract initialization
contract A {
    init() {}
}

contract B {
    // Getter function calculates A's address using its init package
    get fun getAAddress(): Address {
        let initA = initOf A();
        return contractAddress(initA);
    }
}

// Multi-level parent-child relation
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

// Recursive cross-contract initialization
contract A2 {
    init() {}
    // A2 retrieves B2's initialization package
    get fun getBAddr(): Address {
         let initB = initOf B2();
         return contractAddress(initB);
    }
}

contract B2 {
    init() {}
    // B2 retrieves A2's initialization package
    get fun getAAddr(): Address {
         let initA = initOf A2();
         return contractAddress(initA);
    }
}

// Multi-level nested contract graph (deep hierarchy)
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

// Cross-contract naming multiple dependencies using a struct
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

// Recursive self-reference: A contract referencing its own init package
contract Recursive {
    init() {}
    
    get fun selfLoop(): Address {
         return contractAddress(initOf Recursive());
    }
}
