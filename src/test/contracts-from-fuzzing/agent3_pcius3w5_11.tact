/*
 Comprehensive Fuzz-Testing Cycle: 'initOf' and Cross-contract Relationships

 This test suite covers diverse patterns involving the initOf functionality and complex cross-contract initialization
 relationships as discussed in the Tact documentation. 

 Tests included:
 1. Basic cross-contract initialization (Simple contract and Tester calling initOf).
 2. Multi-level hierarchical initialization: Root -> Middle -> Leaf.
 3. Recursive initialization: a contract referencing its own initOf.
 4. Circular dependency between two contracts (A and B).
 5. Diamond dependency graph: Two siblings (Left & Right) referencing the same dependency (C) and initiated by Diamond.
 6. Parameterized contract with explicit init (expected to produce a compilation error), followed by
    a test where the implicit empty init is used with parameters.
 7. Use of constant expressions when calling initOf with parameters.
 8. A complex nested graph combining multiple independent leaves and a branch contract.

 All tests were compiled using the Tact compiler and confirm that the documented behaviors match the
 observed compiler behavior. The one compilation error (explicit init() in a parameterized contract) aligns
 with documented language restrictions.
*/

/***** Test Snippet 1: Basic Cross-contract Initialization ******/

contract Basic {
    init() {}
}

contract Tester {
    fun getBasicInit() : StateInit {
         return initOf Basic();
    }
}

/***** Test Snippet 2: Multi-level Hierarchical Initialization ******/

contract Leaf {
    init() {}
}

contract Middle {
    LeafInit: StateInit;
    init() {
        self.LeafInit = initOf Leaf();
    }
}

contract Root {
    MiddleInit: StateInit;
    init() {
        self.MiddleInit = initOf Middle();
    }
}

/***** Test Snippet 3: Recursive Initialization ******/

contract Recur {
    init() {
         let recInit: StateInit = initOf Recur();
    }
}

/***** Test Snippet 4: Circular Dependency ******/

contract A {
    init() {
        let stateB: StateInit = initOf B();
    }
}

contract B {
    init() {
        let stateA: StateInit = initOf A();
    }
}

/***** Test Snippet 5: Diamond Dependency Graph ******/

contract C {
    init() {}
}

contract Left {
    common: StateInit;
    init() {
        self.common = initOf C();
    }
}

contract Right {
    common: StateInit;
    init() {
        self.common = initOf C();
    }
}

contract Diamond {
    left: StateInit;
    right: StateInit;
    init() {
        self.left = initOf Left();
        self.right = initOf Right();
    }
}

/***** Test Snippet 6: Parameterized Contract with Explicit init (Expected Compilation Error) ******/

// This snippet is expected to fail compilation based on documented behavior that parameterized contracts
// cannot have an explicit init() function.

/*
contract ParamContract(a: Int, b: Int) {
    init() {}
}
*/

/***** Test Snippet 7: Parameterized Contract with Implicit Empty init ******/

contract ParamContract(a: Int, b: Int) {
    // Implicit empty initialization provided by the compiler
}

contract TestParamImplicit {
    fun getParamInit() : StateInit {
         return initOf ParamContract(1, 2);
    }
}

/***** Test Snippet 8: Using Constant Expressions with Parameterized Contract ******/

contract ParamCalc(a: Int, b: Int) {
    // Implicit empty init
}

contract UseCalc {
    fun getCalc() : StateInit {
         let sum = 3 + 4;        // Constant expression
         let prod = sum * 2;       
         return initOf ParamCalc(sum, prod);
    }
}

/***** Test Snippet 9: Complex Nested Contract Graph ******/

contract Leaf1 {
    init() {}
}

contract Leaf2 {
    init() {}
}

contract Branch {
    leaf1: StateInit;
    leaf2: StateInit;
    init() {
        self.leaf1 = initOf Leaf1();
        self.leaf2 = initOf Leaf2();
    }
}

contract RootComplex {
    branch: StateInit;
    extra: StateInit;
    init() {
        self.branch = initOf Branch();
        self.extra = initOf Leaf1();
    }
}
