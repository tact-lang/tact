// Various test cases for initOf functionality and cross-contract relationships

// Test 1: Simple cross-contract usage
contract Child {
    init() {
        // simple child init
    }
}

contract Parent {
    receive() {
        // Calling initOf to obtain Child's init package
        let childInit = initOf Child();
        let addr = contractAddress(childInit);
    }
}

// Test 2: Multi-level hierarchical contract initialization
contract GrandChild {
    init() {
        // GrandChild init
    }
}

contract Child2 {
    init() {
        // Child2 initializes GrandChild
        let gcInit = initOf GrandChild();
    }
}

contract Parent2 {
    receive() {
        // Parent2 initializes Child2
        let childInit = initOf Child2();
        let addr = contractAddress(childInit);
    }
}

// Test 3: Recursive self-referencing initOf
contract RecursiveSelf {
    receive() {
        // Self-reference via initOf of the same contract
        let selfInit = initOf RecursiveSelf();
        let addr = contractAddress(selfInit);
    }
}

// Test 4: Parameterized contract initialization
contract ParamContract(a: Int) {
    // Implicit init using contract parameters
}

contract UseParam {
    receive() {
        // Correct usage with parameter provided
        let pkg = initOf ParamContract(42);
        let addr = contractAddress(pkg);
    }
}

// Test 5: Cyclic dependency between two contracts
contract X {
    init() {
        // X calls initOf on Y
        let yInit = initOf Y();
        let addrY = contractAddress(yInit);
    }
}

contract Y {
    init() {
        // Y calls initOf on X
        let xInit = initOf X();
        let addrX = contractAddress(xInit);
    }
}

// Test 6: Multi-level chain (Level1 -> Level2 -> Level3 -> Level4)
contract Level4 {
    init() {}
}

contract Level3 {
    init() {
        let l4 = initOf Level4();
        let addrL4 = contractAddress(l4);
    }
}

contract Level2 {
    init() {
        let l3 = initOf Level3();
        let addrL3 = contractAddress(l3);
    }
}

contract Level1 {
    init() {
        let l2 = initOf Level2();
        let addrL2 = contractAddress(l2);
    }
}

// Test 7: Using initOf in a getter function
contract GetterInit {
    foo: Int;

    init() {
        self.foo = 7;
    }

    // Getter function using initOf to retrieve its own initial state
    get fun getInitAddress(): Address {
        let pkg = initOf GetterInit();
        return contractAddress(pkg);
    }
}
