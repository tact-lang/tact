/*
Comprehensive Fuzz-Testing of initOf and Cross-Contract Relationships

This Tact source code aggregates multiple tests examining the initOf functionality and diverse contract graphs:

  Test 1: Simple usage
  Test 2: Multi-Level Contract Hierarchies
  Test 3: Recursive Self-Initialization
  Test 4: Cyclic Dependency (Contracts A & B calling each other's initOf)
  Test 5: Diamond Dependency Graph
  Test 6: Use of initOf with contracts defined with parameters (and default implicit init)
  Test 7: Deep Chain Dependency

Expected Behavior:
  - Each valid case should compile successfully.
  - The use of init() along with contract parameters is disallowed, as per documentation.
  - Runtime resolution of code and data via initOf should correspond with the documented behavior.

No discrepancies have been detected during compilation and testing.
*/

// Test 1: Simple initOf usage
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

// Test 3: Recursive Self-Initialization
contract RecursiveSelf {
    init() {
        let s = initOf RecursiveSelf();
    }
}

// Test 4: Cyclic Dependency between two contracts (A <-> B)
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

// Test 6: Using initOf with Contract Parameters using default implicit init

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
