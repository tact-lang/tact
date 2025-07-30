// Comprehensive fuzz-testing cycle for initOf and cross-contract initialization

// Simple cross-contract initialization: Child->Grandchild, Parent returns Child's init address
contract Grandchild {
    init() {}
}

contract Child {
    gc_addr: Address;  // persistent variable
    init() {
        self.gc_addr = contractAddress(initOf Grandchild());
    }
    get fun getGCAddress(): Address {
        return self.gc_addr;
    }
}

contract Parent {
    get fun getChildAddress(): Address {
        return contractAddress(initOf Child());
    }
}

// Recursive initialization: Contract referencing its own initOf
contract Recursive {
    init() {
        // Warning: This is a recursive reference. Depending on implementation, it may trigger an error or be optimized away.
        let addr = contractAddress(initOf Recursive());
    }
}

// Circular dependency: Two contracts referencing each other in their init()
contract A {
    init() {
        let addrB = contractAddress(initOf B());
    }
}

contract B {
    init() {
        let addrA = contractAddress(initOf A());
    }
}

// Deep nested initialization: 5-level contract chain
contract Level5 {
    init() {}
}

contract Level4 {
    init() {
        let a = contractAddress(initOf Level5());
    }
}

contract Level3 {
    init() {
        let a = contractAddress(initOf Level4());
    }
}

contract Level2 {
    init() {
        let a = contractAddress(initOf Level3());
    }
}

contract Level1 {
    get fun getLevel2Address(): Address {
        return contractAddress(initOf Level2());
    }
}

// Parameterized contract initialization: Using implicit init()
contract ParamContract(param: Int) { }

contract Caller {
    get fun getParamAddress(): Address {
        return contractAddress(initOf ParamContract(123));
    }
}

// Multiple initOf calls with identical parameters to compare state initialization determinism
contract Compare {
    get fun compareAddresses(): Bool {
        let addr1 = contractAddress(initOf ParamContract(456));
        let addr2 = contractAddress(initOf ParamContract(456));
        return addr1 == addr2;
    }
}
