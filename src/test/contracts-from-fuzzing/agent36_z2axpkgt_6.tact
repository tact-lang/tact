// Comprehensive Fuzz-Testing Summary for initOf Functionality and Cross-Contract Relationships

// This Tact code consolidates multiple test cases targeting the initOf expression
// and evaluating cross-contract dependencies, multi-level relationships, recursive, and cyclic patterns.
// It does not perform any runtime operations but is used to compile and validate that all documented patterns are accepted.

// Test Case 1: Simple Parent-Child Relationship
contract Child {
    init(x: Int) {
        // Simple initializer using parameter x
        let sum = x + 0; // performing a trivial operation
    }
}

contract Parent {
    init(base: Int) {
        // Using initOf to compute the Child contract's state
        let childState = initOf Child(base);
    }
    receive() {}
}

// Test Case 2: Multi-Level Parent-Child-Grandchild Dependencies
contract Grandchild {
    init(value: Int) {
        // Simple arithmetic to simulate initialization
        let _ = value + 10;
    }
}

contract MidChild {
    init(num: Int) {
        // Initialize Grandchild with a transformation of num
        let gcState = initOf Grandchild(num * 2);
    }
}

contract MultiLevelParent {
    init(base: Int) {
        // Nested initialization: initialize MidChild and another direct call
        let midChildState = initOf MidChild(base + 5);
        let grandchildDirect = initOf Grandchild(base - 3);
    }
    receive() {}
}

// Test Case 3: Recursive Initialization
contract Recursive {
    init(x: Int) {
        // Recursive initOf usage: computing the state of the same contract with modified parameter
        // Note: This is resolved at compile-time without an infinite loop
        let state = initOf Recursive(x + 1);
    }
    receive() {}
}

// Test Case 4: Cyclic Dependency between Contracts A and B
contract A {
    init(x: Int) {
        // Initialize contract B within contract A
        let _ = initOf B(x + 1);
    }
    receive() {}
}

contract B {
    init(y: Int) {
        // Initialize contract A within contract B, creating a cyclic dependency
        let _ = initOf A(y - 1);
    }
    receive() {}
}

// Test Case 5: Use of initOf in Getter and Internal Functions
contract Tester {
    init() {}
    
    // Getter function returning the code cell from the contract's initial state
    get fun initCode(): Cell {
        let state = initOf Tester();
        return state.code;
    }
    
    // Internal function demonstrating retrieval of the data cell from the initial state
    fun getStateData(): Cell {
        let state = initOf Tester();
        return state.data;
    }
    
    receive() {}
}

// No runtime behavior is triggered; all tests are compile-time validations. 
// Documentation references: see   and   for examples of initOf usage.
