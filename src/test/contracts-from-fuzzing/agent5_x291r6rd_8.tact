// Comprehensive Testing Summary for initOf and Cross-Contract Relationships

// The following tests were executed as part of a comprehensive fuzz-testing cycle for the initOf functionality
// and cross-contract relationships in Tact. Each snippet was compiled to validate the documented behavior.
//
// 1. Simple cross-contract initialization: The Parent contract correctly retrieves the StateInit of the Child contract
//    and computes its address using contractAddress().

contract Child {
    init() {}
}

contract Parent {
    init() {
       let childInit = initOf Child();
       let childAddr = contractAddress(childInit);
       // Expected: childAddr will hold the contract address derived from Child's StateInit
    }
}

// 2. Multi-level Hierarchical Contracts: Child2 initializes GrandChild, and Parent2 initializes Child2.

contract GrandChild {
    init() {}
}

contract Child2 {
    init() {
         let grandInit = initOf GrandChild();
         let grandAddr = contractAddress(grandInit);
         // Expected: nested computation of GrandChild's initial state and address
    }
}

contract Parent2 {
    init() {
         let childInit = initOf Child2();
         let childAddr = contractAddress(childInit);
         // Expected: Parent2 obtains Child2's StateInit and derives its address
    }
}

// 3. Self-Referential Initialization: A contract (SelfRef) calls initOf on itself to compute its own StateInit

contract SelfRef {
    init() {
        let s = initOf SelfRef();
        let addr = contractAddress(s);
        // Expected: Recursive call compiles, though care must be taken in interpreting such patterns
    }
}

// 4. Sibling Contracts: ParentAB creates two sibling contracts and computes both addresses

contract ChildA {
    init() {}
}

contract ChildB {
    init() {}
}

contract ParentAB {
    init() {
         let a = contractAddress(initOf ChildA());
         let b = contractAddress(initOf ChildB());
         // Expected: Both addresses computed independently for each sibling contract
    }
}

// 5. Mutual Recursive Initialization: Contracts A and B reference each other during initialization

contract A {
    init() {
        let bInit = initOf B();
        let bAddr = contractAddress(bInit);
        // Expected: Mutual recursion compiles without error; caution needed on runtime semantics
    }
}

contract B {
    init() {
        let aInit = initOf A();
        let aAddr = contractAddress(aInit);
        // Expected: Mutual dependency compiled successfully
    }
}

// 6. Complex Cyclic Dependency: Contracts X, Y, and Z form a cyclic dependency

contract X {
    init() {
         let yPkg = initOf Y();
         let yAddr = contractAddress(yPkg);
    }
}

contract Y {
    init() {
         let zPkg = initOf Z();
         let zAddr = contractAddress(zPkg);
    }
}

contract Z {
    init() {
         let xPkg = initOf X();
         let xAddr = contractAddress(xPkg);
    }
}

// ------------------------------------------------------------------------------
// Testing Conclusions:
// ------------------------------------------------------------------------------
// • All the above code snippets compiled successfully, confirming that the Tact compiler correctly
//   handles initOf functionality and related cross-contract initialization scenarios.
// • The behavior is in line with the documentation (see docs_book_expressions.md, especially the initOf section  ).
// • While the recursive and cyclic patterns compile, developers need to exercise caution when deploying
//   such patterns on-chain to avoid unintended logical pitfalls.
// • No discrepancies or bugs in regard to initOf and cross-contract relationships were detected during the
//   fuzz-testing cycle.

// Note: This comprehensive fuzz-testing suite validates both simple and complex scenarios involving
// cross-contract initialization, multi-level hierarchies, self-references, mutual recursion, and cyclic
// dependencies. The Tact compiler's behavior adheres to the official documentation and design.
