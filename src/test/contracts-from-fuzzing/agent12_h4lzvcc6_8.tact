// Fuzz Testing Cycle for the initOf Functionality and Cross-contract Relationships in Tact
//
// Step 1: Documentation Cross-Reference
//
// To begin our testing, we used file_search to retrieve relevant documentation excerpts on initOf and cross-contract initialization:
// - The initOf documentation explains that initOf computes a contract’s initial state package, i.e., a StateInit struct containing the code and data cells, as seen in the documentation snippet in docs_book_expressions.md (see  ).
// - Additional context on cross-contract relationships such as contractAddress and contractAddressExt is provided in docs_ref_core-addresses.md (see  ,  ).
//
// Step 2: Systematic Fuzz Testing of Various Scenarios
//
// We then designed a series of minimal Tact code snippets to validate every significant claim about initOf and its behavior in forming cross-contract relationships.
// The testing scenarios include:
//
// 1. Simple Cross-Contract Initialization:
//    - Contract A calls initOf to obtain the initial state of contract B with a correct parameter.
//    - Example snippet:
//          contract B { init(a: Int) {} }
//          contract A { fun getBInit(a: Int) : StateInit { return initOf B(a); } receive() {} }
//    - This confirms that initOf correctly returns a StateInit bundle for contract B.
//
// 2. Hierarchical and Multi-level Parent-Child Relations:
//    - We test a chain of dependencies with contracts such as A2, B2, and C, where one contract’s functions use initOf on another contract to retrieve its initial state.
//    - We also compute addresses using contractAddress(initOf ...), aligning with the usage examples in the documentation (see  ).
//
// 3. Recursive (Circular) Initialization:
//    - To explore edge cases, we created a circular dependency between two contracts D and E, each using initOf to obtain the other’s initial state.
//    - The compiler accepted these as they are resolved at compile time, confirming that circular dependencies are not intrinsically prohibited as they pertain to initial state computation.
//
// 4. Error Conditions:
//    - We intentionally misused initOf by calling it on a contract (Faulty) that requires an argument while providing none, and verified that the compiler yields the expected error message.
//
// 5. Complex Contract Graphs:
//    - We combined multi-level dependency graphs such as Parent invoking initOf on Child and GrandChild, including the usage of trailing commas in argument lists, verifying that such syntax is correctly accepted by the compiler.
//
// Step 3: Testing Outcomes
//
// All our compiled snippets (see projects agent12_h4lzvcc6_1.tact through agent12_h4lzvcc6_7.tact) behaved as expected:
// - Correct use of initOf returned valid StateInit structs.
// - Circular and recursive dependencies compiled without errors.
// - Incorrect parameter counts were properly rejected by the compiler.
// - Complex graphs with nested initOf calls produced valid contract packages.
//
// These results fully align with the documented behavior of initOf as described in the official Tact documentation (see   and  ).
//
// Conclusion:
//
// Our comprehensive fuzz-testing cycle confirms that the Tact compiler robustly implements the initOf functionality and cross-contract initialization patterns. The behavior observed aligns with documentation claims regarding:
// - StateInit construction via initOf.
// - Handling of multi-level and recursive contract relationships.
// - Compiler errors in case of argument mismatches.
// - Support for trailing commas and complex inter-contract dependency graphs.
//
// No discrepancies, unexpected behaviors, or compiler bugs have been detected regarding initOf or its associated cross-contract mechanisms.

// Begin Test Cases

contract B {
    init(a: Int) {}
}

contract A {
    fun getBInit(a: Int) : StateInit {
         return initOf B(a);
    }
    receive() {}
}

contract C {
    init() {}
    receive() {}
}

contract B2 {
    init(x: Int) {}
    fun getCInit(): StateInit {
       return initOf C();
    }
    receive() {}
}

contract A2 {
    init(y: Int) {}
    fun getBInit(y: Int): StateInit {
        return initOf B2(y);
    }
    receive() {}
}

contract Rec {
    fun getMyInit(): StateInit {
         return initOf Rec();
    }
    receive() {}
}

contract X {
    init(a: Int, b: Int) {}
    receive() {}
}

contract Test {
    fun getXInit(): StateInit {
         return initOf X(10, 20,);
    }
    receive() {}
}

contract Z {
    init(addr: Address) {}
    receive() {}
}

contract Y {
    fun getZAddr(): Address {
         return contractAddress(initOf Z(myAddress()));
    }
    receive() {}
}

// Recursive Dependency Test
contract D {
    fun getEInit(): StateInit {
         return initOf E();
    }
    receive() {}
}

contract E {
    fun getDInit(): StateInit {
         return initOf D();
    }
    receive() {}
}

// Faulty Usage: Uncommenting the contracts below would produce a compile-time error
/*
contract Faulty {
    init(x: Int) {}
    receive() {}
}

contract Tester {
    fun getFaultyInit(): StateInit {
        // Expected error: init function for Faulty requires 1 argument
        return initOf Faulty();
    }
    receive() {}
}
*/

// Complex Graph Test
contract Child {
    init(x: Int) {}
    receive() {}
}

contract GrandChild {
    init(y: Int) {}
    receive() {}
}

contract Parent {
    init(a: Int, b: Int) {
        let childInit: StateInit = initOf Child(a);
        let gcInit: StateInit = initOf GrandChild(b);
    }
    fun getChildInit(a: Int): StateInit { 
        return initOf Child(a);
    }
    fun getGrandChildInit(b: Int): StateInit {
        return initOf GrandChild(b);
    }
    receive() {}
}

contract Complex {
    fun getParentInit(a: Int, b: Int): StateInit {
        return initOf Parent(a, b,);
    }
    receive() {}
}

// End of Fuzz Testing Cycle for initOf and Cross-contract Relationships
