// Comprehensive Fuzz Testing for initOf functionality and Cross-Contract Relationships

// Test 1: Simple cross-contract initialization
contract A {
    init() {}
}

contract B {
    // Simple receiver that initializes contract A
    receive() {
        let s = initOf A();
    }
}

// Test 2: Multi-level parent-child contracts
contract Grandparent {
    receive() {
        // Grandparent initializes Parent
        let s = initOf Parent();
    }
}

contract Parent {
    init() {}
    receive() {
        // Parent initializes Child
        let s = initOf Child();
    }
}

contract Child {
    init() {}
    receive() {
        // Basic receive function
    }
}

// Test 3: Recursive self-initialization (self-reference)
contract SelfRef {
    init() {}
    receive() {
        // Self-initializing
        let s = initOf SelfRef();
    }
}

// Test 4: Cross-contract cyclic dependency
contract CrossCycleA {
    receive() {
        // A initializes B (cyclic dependency)
        let s = initOf CrossCycleB();
    }
}

contract CrossCycleB {
    receive() {
        // B initializes A (cyclic dependency)
        let s = initOf CrossCycleA();
    }
}

// Test 5: Contract with parameters and trailing comma
contract Param {
    init(x: Int) {
        // Parameter x is used for initialization
    }
    receive() {
        // Initialize with a parameter and trailing comma
        let s = initOf Param(123,);
    }
}

// Test 6: Use initOf in computing self-address
contract F {
    init() {}
    receive() {
        // Compute the contract's address using its initial state
        let addr = contractAddress(initOf F());
    }
}

// Test 7: Multiple independent initializations in a single contract
contract Root {
    receive() {
        let aState = initOf A();
        let paramState = initOf Param(10,); // Param expects one parameter
        let cState = initOf C();
    }
}

// Test 8: Contract C used in Test 7 and further initialization
contract C {
    init() {}
    receive() {
        // Initialize A from within C
        let aState = initOf A();
    }
}

// Test 9: Conditional use of initOf within branching
contract ConditionalInit {
    receive() {
        if (1 == 1) {
            // True branch: initialize D
            let dState = initOf D();
        } else {
            // False branch: simple assignment
            let x = 0;
        }
    }
}

contract D {
    init() {}
    receive() {}
}

// End of comprehensive fuzz testing for initOf and cross-contract relationships
