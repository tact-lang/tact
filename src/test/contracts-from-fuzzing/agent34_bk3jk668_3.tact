contract Child {
    init() {}
}

// MultiInit with a single return value (Bool) that compares two independently computed addresses
contract MultiInit {
    fun getDifferentAddresses() : Bool {
        let addr1 = contractAddress(initOf Child());
        let addr2 = contractAddress(initOf Child());
        // Typically, the addresses are computed deterministically from the contract's init package.
        // If Child is stateless, then these two should be identical. 
        // For fuzz testing, we verify that they match or differ intentionally.
        return addr1 != addr2;
    }
}

contract SimpleParent {
    // Simple cross-contract initialization: getting Child's address
    fun getChildAddress() : Address {
         let childInit = initOf Child();
         return contractAddress(childInit);
    }
}

contract GrandChild {
    init() {}
}

contract Intermediate {
    // Multi-level parent-child relation: Intermediate gets GrandChild's address
    fun getGrandChildAddress() : Address {
        let gi = initOf GrandChild();
        return contractAddress(gi);
    }
}

contract Parent {
    // Parent can compute its dependency addresses in a multi-level fashion
    fun getIntermediateAddress() : Address {
        let ii = initOf Intermediate();
        return contractAddress(ii);
    }
    
    // Directly compute GrandChild's address without intermediate step
    fun getGrandChildAddressDirect() : Address {
        let gi = initOf GrandChild();
        return contractAddress(gi);
    }
}

contract CycleA {
    // Recursive cycle: CycleA and CycleB refer to each other.
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
    // A contract referencing its own initialization
    fun getSelfInitAddress() : Address {
        let selfInit = initOf SelfRecursive();
        return contractAddress(selfInit);
    }
}

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
