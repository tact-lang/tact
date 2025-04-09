/*
Fuzz-testing of initOf and cross-contract relationships

This set of tests verifies various documented behaviors of the initOf functionality, including:
  - Simple cross-contract initOf usage
  - Multi-level hierarchical contracts
  - Recursive self-initialization
  - Cyclic contract dependency
  - Diamond dependency graphs
  - Using initOf with contract parameters (with default empty init)
  - Deep chain dependency

Each test is expected to compile successfully as per documentation.
*/

// Test 1: Simple usage of initOf in a single contract call
contract ContractB {
    init() {}
}

contract ContractA {
    receive() {
        let s = initOf ContractB();
        let addr = contractAddress(s);
    }
}


// Test 2: Multi-Level Relationships
contract ContractC {
    init() {}
}

contract ContractB2 {
    init() {
        let s = initOf ContractC();
    }
}

contract ContractA2 {
    receive() {
        let s1 = initOf ContractB2();
        let s2 = initOf ContractC();
    }
}


// Test 3: Recursive Initialization (self-reference)
contract RecursiveSelf {
    init() {
        let s = initOf RecursiveSelf();
    }
}


// Test 4: Cyclic Dependency between two contracts
contract A {
    init() {
        let s = initOf B();
    }
}

contract B {
    init() {
        let s = initOf A();
    }
}


// Test 5: Diamond Dependency Graph

contract D {
    init() {}
}

contract B3 {
    init() {
        let s = initOf D();
    }
}

contract C2 {
    init() {
        let s = initOf D();
    }
}

contract A3 {
    receive() {
        let s1 = initOf B3();
        let s2 = initOf C2();
    }
}


// Test 6: Using initOf with Contract Parameters (default init is used)

contract ParamContractNoInit(param: Int) {}

contract CallerWithParam {
    receive() {
        let s = initOf ParamContractNoInit(123);
    }
}


// Test 7: Deep Chain Dependency (4 levels)

contract Level4 {
    init() {}
}

contract Level3 {
    init() {
        let s = initOf Level4();
    }
}

contract Level2 {
    init() {
        let s = initOf Level3();
    }
}

contract Level1 {
    receive() {
        let s = initOf Level2();
    }
}
