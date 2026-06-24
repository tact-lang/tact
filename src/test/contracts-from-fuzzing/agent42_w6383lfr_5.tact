// Fuzz-testing cycle on initOf and cross-contract relationships

// Test 1: Simple cross-contract initialization
contract SimpleA {
    init() {
        // No dependency
    }
    receive() {}
}

contract SimpleB {
    init() {
        // Use initOf to get state of SimpleA
        let initA = initOf SimpleA();
        // Compute address as further usage
        let addrA = contractAddress(initA);
    }
    receive() {}
}

// Test 2: Self-recursive initialization
contract SelfRec {
    init() {
        // Self-recursive call using initOf on the same contract
        let _ = initOf SelfRec();
    }
    receive() {}
}

// Test 3: Diamond dependency pattern with shared grandchild
contract Grandchild {
    init() { }
    receive() {}
}

contract Child1 {
    init() {
        // Depends on Grandchild
        let _ = initOf Grandchild();
    }
    receive() {}
}

contract Child2 {
    init() {
        // Also depends on Grandchild
        let _ = initOf Grandchild();
    }
    receive() {}
}

contract Parent {
    init() {
        // Parent depends on both children
        let _ = initOf Child1();
        let _ = initOf Child2();
    }
    receive() {}
}

// Test 4: Contract parameters in conjunction with initOf
contract WithParams(param: Int) {
    // Implicit empty init
    receive() {}
}

contract UsesParams {
    init() {
         // Passing parameter to a contract that uses contract parameters syntax
         let _ = initOf WithParams(123);
    }
    receive() {}
}

// Test 5: Cross-recursive initialization between two contracts
contract CrossA {
    init() {
         // Call initOf on CrossB from within CrossA
         let _ = initOf CrossB();
    }
    receive() {}
}

contract CrossB {
    init() {
         // Call initOf on CrossA from within CrossB
         let _ = initOf CrossA();
    }
    receive() {}
}

// Tester contract to trigger all initializations
contract Tester {
    init() {
        let _ = initOf SimpleA();
        let _ = initOf SimpleB();
        let _ = initOf SelfRec();
        let _ = initOf Grandchild();
        let _ = initOf Child1();
        let _ = initOf Child2();
        let _ = initOf Parent();
        let _ = initOf WithParams(456);
        let _ = initOf UsesParams();
        let _ = initOf CrossA();
        let _ = initOf CrossB();
    }
    receive() {}
}
