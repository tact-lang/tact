// Fuzz-testing cycle for initOf and cross-contract relationships
// 
// We are testing a variety of scenarios:
// 1. Simple cross-contract initialization:
contract ChildSimple {
    init(val: Int) {
        // nothing more
    }
}

contract ParentSimple {
    init() {
        let childState = initOf ChildSimple(42);
        let addr = contractAddress(childState);
    }
}

// 2. Multi-level/hierarchical parent-child initialization:

contract Grandchild {
    init(val: Int) {
        // Minimal initialization
    }
}

contract Child {
    init(val: Int) {
        // Nested initOf call to compute Grandchild init
        let grandState = initOf Grandchild(val + 1);
    }
}

contract Parent {
    init() {
        // Multi-level: Parent -> Child -> Grandchild
        let childState = initOf Child(10);
        let addr = contractAddress(childState);
    }
}

// 3. Self-referential initialization (recursive in same contract):

contract SelfReferential {
    init() {
         // Direct self-recursive initOf call. This should not produce an infinite recursion in initialization,
         // but computes the state package of SelfReferential.
         let state = initOf SelfReferential();
         let addr = contractAddress(state);
    }
}

// 4. Mutual recursion between two contracts:

contract A {
    init() {
        // A initializes B
        let bState = initOf B(100);
        let addrB = contractAddress(bState);
    }
}

contract B {
    init(val: Int) {
        // B initializes A, creating a cycle.
        let aState = initOf A();
        let addrA = contractAddress(aState);
    }
}

// 5. Deep, long chain of nested contracts:

contract E {
    init(val: Int) { }
}

contract D {
    init(val: Int) {
        let eState = initOf E(val + 1);
    }
}

contract C {
    init(val: Int) {
        let dState = initOf D(val + 1);
    }
}

contract B_Long {
    init(val: Int) {
        let cState = initOf C(val + 1);
    }
}

contract A_Long {
    init(val: Int) {
        let bState = initOf B_Long(val + 1);
        let addr = contractAddress(bState);
    }
}

// The above snippet combines all test cases in one file.
// Each contract tests various properties of initOf:
// - Simple use cases
// - Multi-level nested initOf with varying parameters
// - Recursive and cyclic initialization references
// 
// All snippets are expected to compile without errors if the Tact compiler complies with the official documentation on initOf usage and cross-contract relationships.
// The expected behavior is that the computed StateInit packages (obtained via initOf) return valid code/data pairs, which in turn produce consistent contract addresses.

// This fuzz-testing snippet does not attempt to execute any runtime behavior and is solely used to compile and validate the structure of initOf and contractAddress in various configurations.

// End of fuzz-testing cycle snippet.
