// Fuzz-testing snippet for initOf and cross-contract relationships

// Simple cross-contract initialization
contract Child {
    init() {}
}

contract SimpleParent {
    // Using initOf to retrieve Child's address
    fun getChildAddress() : Address {
         let childInit = initOf Child();
         return contractAddress(childInit);
    }
}

// Multi-level parent-child hierarchy
contract GrandChild {
    init() {}
}

contract Intermediate {
    // Retrieves GrandChild's address
    fun getGrandChildAddress() : Address {
        let gi = initOf GrandChild();
        return contractAddress(gi);
    }
}

contract Parent {
    // Retrieves Intermediate's address
    fun getIntermediateAddress() : Address {
        let ii = initOf Intermediate();
        return contractAddress(ii);
    }
    // Directly retrieves GrandChild's address
    fun getGrandChildAddressDirect() : Address {
        let gi = initOf GrandChild();
        return contractAddress(gi);
    }
}

// Recursive and cyclic initialization cases
contract CycleA {
    fun getCycleBAddress() : Address {
        let b = initOf CycleB();
        return contractAddress(b);
    }
}

contract CycleB {
    fun getCycleAAddress() : Address {
        let a = initOf CycleA();
        return contractAddress(a);
    }
}

contract SelfRecursive {
    // Contract referencing its own init state
    fun getSelfInitAddress() : Address {
        let selfInit = initOf SelfRecursive();
        return contractAddress(selfInit);
    }
}

// Parameterized contract example
contract ParamContract {
    x: Int;
    init(x: Int) {
        self.x = x;
    }
}

contract ParamUser {
    fun getParamAddress() : Address {
        let pkg = initOf ParamContract(100,);
        return contractAddress(pkg);
    }
}

// Edge-case: multiple invocations producing identical results
contract MultiInit {
    fun compareChildAddresses() : Bool {
        let addr1 = contractAddress(initOf Child());
        let addr2 = contractAddress(initOf Child());
        // For a stateless contract like Child, the addresses are expected to be identical
        return addr1 == addr2;
    }
}
