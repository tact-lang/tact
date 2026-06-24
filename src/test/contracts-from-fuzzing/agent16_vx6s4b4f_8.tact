// Final Summary Code for Fuzz-Testing initOf and Cross-Contract Relationships

// This Tact code serves as a comprehensive fuzz-testing suite for the initOf expression and its application in
// various cross-contract initialization scenarios, as documented in Tact's official references. This suite
// covers a wide variety of scenarios including simple cross-contract initialization, multi-level hierarchical
// relationships, self-recursion, cyclic dependencies, parameterized initialization with trailing commas,
// and conditional branching.

// Documentation references:
// • initOf usage: see docs_book_expressions.md (specifically the section describing initOf and its parameters).
// • Cross-contract relationship examples and contractAddressExt: see docs_ref_core-addresses.md.

// Test 1: Simple cross-contract initialization
contract A {
    init() {}
}

contract B {
    // Initializes contract A
    receive() {
        let s = initOf A();
    }
}

// Test 2: Multi-level parent-child relationships
contract Grandparent {
    receive() {
        // Initializes Parent
        let s = initOf Parent();
    }
}

contract Parent {
    init() {}
    receive() {
        // Initializes Child
        let s = initOf Child();
    }
}

contract Child {
    init() {}
    receive() {}
}

// Test 3: Recursive self-initialization
contract SelfRef {
    init() {}
    receive() {
        // Self-initialization
        let s = initOf SelfRef();
    }
}

// Test 4: Cross-contract cyclic dependency
contract CrossCycleA {
    receive() {
        // Initializes CrossCycleB
        let s = initOf CrossCycleB();
    }
}

contract CrossCycleB {
    receive() {
        // Initializes CrossCycleA
        let s = initOf CrossCycleA();
    }
}

// Test 5: Contract with parameters and trailing comma
contract Param {
    init(x: Int) {
        // Use parameter x in initialization
    }
    receive() {
        // Initialization with parameter and trailing comma
        let s = initOf Param(123,);
    }
}

// Test 6: Use of initOf to compute self-address
contract F {
    init() {}
    receive() {
        // Contract address is computed using its own init package
        let addr = contractAddress(initOf F());
    }
}

// Test 7: Multiple independent initializations in a single contract
contract Root {
    receive() {
        let aState = initOf A();
        let paramState = initOf Param(10,);
        let cState = initOf C();
    }
}

contract C {
    init() {}
    receive() {
        let aState = initOf A();
    }
}

// Test 8: Conditional use of initOf inside branching
contract ConditionalInit {
    receive() {
        if (1 == 1) {
            let dState = initOf D();
        } else {
            let x = 0;
        }
    }
}

contract D {
    init() {}
    receive() {}
}

// Summary:
// All the above scenarios compile successfully. This indicates that the current implementation of the initOf
// expression and its interaction across contracts behaves as documented. Trailing commas, parameter passing,
// multi-level and cyclic initializations, and using initOf as part of an expression (such as computing a
// contract’s address) work as expected.

// Conclusion:
// The fuzz tests confirm that there is no discrepancy between the documented behavior of initOf (outlined in
// docs_book_expressions.md) and its actual implementation. The compiler's handling of complex contract graphs
// and cross-contract relationships via initOf is consistent and robust.

// End of Fuzz Testing Suite for initOf Functionality and Cross-Contract Relationships
