// Fuzz Testing Cycle Summary for initOf Functionality and Cross-Contract Relationships

// The series of tests below was designed to probe the boundaries of the initOf expression and cross-contract dependency behaviors
// documented in Tact. In particular, we tested: 
// 1. Simple cross-contract initialization (contract B initializing contract A).
// 2. Multi-level parent-child relationships (Grandparent -> Parent -> Child).
// 3. Recursive self-initialization (SelfRef, where a contract calls initOf on itself).
// 4. Cross-contract cyclic dependency (CrossCycleA and CrossCycleB calling each other).
// 5. Initialization with parameters and usage of trailing commas (Param contract).
// 6. Using initOf in an expression to compute a contract’s address (F contract).
// 7. Multiple independent initializations within a single contract (Root contract initializing A, Param, and C).
// 8. Conditional branching with initOf use (ConditionalInit contract).

// All these constructs were compiled successfully, with behavior that adheres to the documented semantics of initOf as explained in
// docs_book_expressions.md (see citation   for initOf syntax and usage) and the cross-contract dependency descriptions in
// docs_ref_core-addresses.md (see citation   and  ).

// These tests confirm that:
// - Trailing commas and parameterized initializations work as expected.
// - Multi-level and cyclic dependency initializations compile correctly.
// - The use of initOf within expressions (such as computing a contract's address via contractAddress(initOf F())) is consistent with
//   expectations from the documentation.

// Below, the complete code of the fuzz test is provided. In our testing session, no unexpected errors or discrepancies were found.

// Test 1: Simple cross-contract initialization
contract A {
    init() {}
}

contract B {
    receive() {
        let s = initOf A();
    }
}

// Test 2: Multi-level parent-child relationships
contract Grandparent {
    receive() {
        let s = initOf Parent();
    }
}

contract Parent {
    init() {}
    receive() {
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
        let s = initOf SelfRef();
    }
}

// Test 4: Cross-contract cyclic dependency
contract CrossCycleA {
    receive() {
        let s = initOf CrossCycleB();
    }
}

contract CrossCycleB {
    receive() {
        let s = initOf CrossCycleA();
    }
}

// Test 5: Contract with parameters and trailing comma
contract Param {
    init(x: Int) {
        // Use parameter x
    }
    receive() {
        let s = initOf Param(123,);
    }
}

// Test 6: Using initOf in computing self-address
contract F {
    init() {}
    receive() {
        let addr = contractAddress(initOf F());
    }
}

// Test 7: Multiple independent initializations in one contract
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

// Test 8: Conditional use of initOf
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

// Conclusion:
// The compiler's behavior when processing these various initOf scenarios matches the official documentation, and no unexpected errors were observed.
// Fuzz testing on initOf functionality and related cross-contract relationships supports the robustness and consistency of the compiler's implementation.
