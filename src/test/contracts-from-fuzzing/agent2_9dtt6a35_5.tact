// Comprehensive summary of fuzz-testing for initOf functionality and cross-contract relationships

// Test 1: Simple cross-contract initialization
contract ContractB {
    init() {
        // Empty init function
    }
}

contract ContractA {
    receive() {
         // Force computation of the StateInit of ContractB using initOf
         let s = initOf ContractB();
         let _ = s.code;
         let __ = s.data;
    }
}

// Test 2: Multi-level hierarchical parent-child relation
contract ContractC {
    init() {
        // Empty initialization
    }
}

contract ContractB_Multi {
    receive() {
        // ContractB_Multi initializes ContractC
        let sC = initOf ContractC();
        let _ = sC.code;
        let __ = sC.data;
    }
}

contract ContractA_Multi {
    receive() {
        // ContractA_Multi initializes ContractB_Multi
        let sB = initOf ContractB_Multi();
        let _ = sB.code;
        let __ = sB.data;
    }
}

// Test 3: Recursive initialization of a contract with itself
contract SelfRec {
    init() {
        let s = initOf SelfRec();
        let _ = s.code;
        let __ = s.data;
    }
}

// Test 4: Cyclic cross-contract initialization
contract CyclicA {
    receive() {
        // CyclicA initializes CyclicB
        let sB = initOf CyclicB();
        let _ = sB.code;
    }
}

contract CyclicB {
    init() {
        // CyclicB cyclically initializes CyclicA
        let sA = initOf CyclicA();
        let _ = sA.data;
    }
}

// Test 5: Long nested contract graph (multi-level initialization)
contract ContractE {
    init() {
        // Terminal contract with empty init
    }
}

contract ContractD {
    receive() {
        let sE = initOf ContractE();
        let _ = sE.code;
    }
}

contract ContractC_Nested {
    receive() {
        let sD = initOf ContractD();
        let _ = sD.data;
    }
}

contract ContractB_Nested {
    receive() {
        let sC = initOf ContractC_Nested();
        let _ = sC.code;
    }
}

contract ContractA_Nested {
    receive() {
        let sB = initOf ContractB_Nested();
        let _ = sB.data;
    }
}

// Test 6: Using initOf with contract parameters
contract ParamContract(param: Int) {
    // Uses contract parameters, so an implicit empty init exists
}

contract CallerContract {
    receive() {
        let s = initOf ParamContract(100);
        let _ = s.code; // force computation
        let _ = s.data;
    }
}

// ----------------------
// Summary:
// We conducted extensive fuzz-testing examining the initOf functionality and its use in various cross-contract initialization patterns. 
// Our tests covered simple initialization, multi-level parent-child relationships, self-recursion, cyclic initialization between contracts, 
// deep nested contract graphs, and contracts with parameters. All snippets compiled as expected with no unexpected behavior, 
// consistent with documentation (see docs:  ,  ,  ).

// Our tests confirm that:
// 1. The basic usage and forced evaluation of the StateInit via initOf is working correctly.
// 2. Multi-level and cyclic contract initializations (even if unusual) are accepted by the compiler.
// 3. Contracts using parameters are correctly handled by initOf as documented.
// 
// No discrepancies between compiler behavior and the documentation on cross-contract relationships have been observed during these tests.

// Further testing will explore more edge cases and scenarios should they arise in advanced usage patterns.
