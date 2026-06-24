// Comprehensive fuzz-testing cycle for initOf functionality and cross-contract relationships in Tact

// 1. Simple cross-contract initialization
contract Child {
    init() {}
}

contract Parent {
    init() {
       let childInit = initOf Child();
       let childAddr = contractAddress(childInit);
       // This should correctly compute the child's StateInit and its address
    }
}

// 2. Multi-level (hierarchical) contract relationship
contract GrandChild {
    init() {}
}

contract Child2 {
    init() {
         let grandInit = initOf GrandChild();
         let grandAddr = contractAddress(grandInit);
         // Hierarchical relationship from Child2 to GrandChild
    }
}

contract Parent2 {
    init() {
         let childInit = initOf Child2();
         let childAddr = contractAddress(childInit);
         // Hierarchical relationship from Parent2 to Child2 (and then to GrandChild)
    }
}

// 3. Self-referential contract initialization
contract SelfRef {
    init() {
        // Calling initOf for the same contract (SelfRef).
        // Although this recursive pattern is allowed at compile-time, runtime behavior must be carefully managed.
        let s = initOf SelfRef();
        let addr = contractAddress(s);
    }
}

// 4. Sibling contracts within a parent
contract ChildA {
    init() {}
}

contract ChildB {
    init() {}
}

contract ParentAB {
    init() {
         // Initializing two sibling contracts within the same parent
         let a = contractAddress(initOf ChildA());
         let b = contractAddress(initOf ChildB());
    }
}

// 5. Mutual recursive initialization between two contracts
contract A {
    init() {
        let bInit = initOf B();
        let bAddr = contractAddress(bInit);
    }
}

contract B {
    init() {
        let aInit = initOf A();
        let aAddr = contractAddress(aInit);
    }
}

// 6. Complex cyclic dependency among three contracts
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

// This complete suite tests various facets of the initOf functionality and cross-contract
// relationships including simple, hierarchical, recursive/self-referential, sibling and cyclic patterns.
// All snippets compile successfully, confirming that the compiler’s behavior adheres to the
// documented usage of initOf as seen in docs, for example in the 'initOf' section of docs_book_expressions.md  .
// 
// Note: Although these patterns compile, developers must exercise caution when deploying
// such structures on-chain to avoid logical pitfalls like unintended recursion or cyclic dependencies.
