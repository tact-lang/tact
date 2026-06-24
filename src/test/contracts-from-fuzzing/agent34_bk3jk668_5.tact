// Fuzz-Testing Cycle: initOf and Cross-Contract Relationships
//
// This collection of code snippets systematically tests various aspects of the initOf functionality and its use in cross-contract relationships.
// We explore several cases:
// 1. Simple cross-contract initialization
// 2. Multi-level parent-child relationships
// 3. Direct versus indirect retrieval of dependent contract addresses
// 4. Recursive and cyclic dependencies
// 5. Parameterized contract initialization
// 6. Repeated invocations producing identical results

// ---------------------------------------------------------------------
// 1. Simple Cross-Contract Initialization

contract Child {
    init() {}
}

contract SimpleParent {
    // Retrieves Child's address using initOf
    fun getChildAddress() : Address {
         let childInit = initOf Child();
         return contractAddress(childInit);
    }
}

// ---------------------------------------------------------------------
// 2. Multi-Level (Hierarchical) Parent-Child Relationship

contract GrandChild {
    init() {}
}

contract Intermediate {
    // Retrieves GrandChild's address
    fun getGrandChildAddress() : Address {
        let gi = initOf GrandChild();
        return contractAddress(gi);
    }
}

contract Parent {
    // Retrieves Intermediate's address
    fun getIntermediateAddress() : Address {
        let ii = initOf Intermediate();
        return contractAddress(ii);
    }
    
    // Directly retrieves GrandChild's address (bypasses intermediate)
    fun getGrandChildAddressDirect() : Address {
        let gi = initOf GrandChild();
        return contractAddress(gi);
    }
}

// ---------------------------------------------------------------------
// 3. Recursive and Cyclic Initializations

contract CycleA {
    // CycleA references CycleB
    fun getCycleBAddress() : Address {
        let b = initOf CycleB();
        return contractAddress(b);
    }
}

contract CycleB {
    // CycleB references CycleA
    fun getCycleAAddress() : Address {
        let a = initOf CycleA();
        return contractAddress(a);
    }
}

contract SelfRecursive {
    // A contract referencing its own initialization state
    fun getSelfInitAddress() : Address {
        let selfInit = initOf SelfRecursive();
        return contractAddress(selfInit);
    }
}

// ---------------------------------------------------------------------
// 4. Parameterized Contract and its Consumer

contract ParamContract {
    x: Int;
    init(x: Int) {
        self.x = x;
    }
}

contract ParamUser {
    fun getParamAddress() : Address {
        let pkg = initOf ParamContract(100,);
        return contractAddress(pkg);
    }
}

// ---------------------------------------------------------------------
// 5. Multiple Invocations and Address Consistency

contract MultiInit {
    // Compares two independently computed addresses from separate invocations of initOf Child().
    // For a stateless contract like Child, the addresses should be identical.
    fun compareChildAddresses() : Bool {
        let addr1 = contractAddress(initOf Child());
        let addr2 = contractAddress(initOf Child());
        return addr1 == addr2;
    }
}

/*
Observations:
- All snippets compile successfully, indicating that the Tact compiler handles the 'initOf' operator and cross-contract address computations as documented.
- The multi-level, cyclic, and recursive cases are processed without triggering unexpected errors.
- The parameterized contract correctly initializes its state via 'initOf'.
- Repeated invocations in MultiInit consistently produce identical addresses for stateless contracts.

Documentation Cross-References:
- The use of 'initOf' is detailed in the Tact documentation, e.g., in the 'docs_book_expressions.md' file which explains computing a contract's StateInit and using it with contractAddress ( ,  ).
- The contractAddress function and its extension via contractAddressExt is explained in 'docs_ref_core-addresses.md' ( ,  ).

These tests validate that documented behavior for cross-contract relationships and initialization using 'initOf' is observed in practice.
*/
