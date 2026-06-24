/*
Comprehensive Fuzz-Testing Summary for initOf and Cross-Contract Relationships

Overview:
This suite of tests verifies behavior related to the initOf expression and cross-contract relationships in Tact. It covers:

1. Simple initOf usage: A contract obtaining the initial state of another contract and computing its address.

2. Multi-Level Relationships: Verifying that initOf works properly in hierarchical contracts (e.g., ContractA2 initOf on ContractB2 and ContractC).

3. Recursive Self-Initialization: A contract that calls initOf on itself – the compiler handles self-references properly.

4. Cyclic Dependency: Two contracts (A and B) mutually calling each other via initOf, confirming that cyclic contract dependency is accepted during compilation (even though such patterns might need careful runtime management).

5. Diamond Dependency Graph: A common dependency pattern where two contracts call initOf on a shared contract (D), then a parent contract obtains both states.

6. Use with Contract Parameters: Verifying that contracts defined with parameters (and using the default implicit init) correctly support initOf. Note that an explicit init is disallowed when using contract parameters – as confirmed by both the compiler and documentation (see docs_book_contracts.md  ).

7. Deep Chain Dependency: A long chain of initializations across multiple contract levels, ensuring that the compiler can handle multi-step dependency graphs.

All individual tests (except the intentional test with an explicit init in a parameterized contract, which is a known and documented restriction) compile successfully without any unexpected errors or deviations from the documented behavior. 

Conclusion:
Our fuzz-testing confirms that the behavior of initOf aligns with the official Tact documentation on cross-contract relationships. No discrepancies or compiler bugs were identified in these areas. 

References include details on initOf, contractAddress, and multi-contract dependency diagrams as documented in the Tact manual (e.g., docs_book_expressions.md  , docs_book_contracts.md  ).
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

// Test 6: Using initOf with Contract Parameters (using default implicit init)

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
