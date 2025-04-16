// Test 1: Recursive initialization of a contract with itself

contract SelfRec {
    init() {
        // Recursive call: SelfRec initializes its own state
        let s = initOf SelfRec();
        // Use fields to force computation
        let _ = s.code;
        let __ = s.data;
    }
}

// Test 2: Cyclic cross-contract initialization between two contracts

contract ContractA {
    receive() {
        // ContractA initializes ContractB
        let sB = initOf ContractB();
        let _ = sB.code;
    }
}

contract ContractB {
    init() {
        // ContractB cyclically initializes ContractA
        let sA = initOf ContractA();
        let _ = sA.data;
    }
}

// Test 3: Long nested contract graph (multi-level initialization)

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

contract ContractC {
    receive() {
        let sD = initOf ContractD();
        let _ = sD.data;
    }
}

contract ContractB2 {
    receive() {
        let sC = initOf ContractC();
        let _ = sC.code;
    }
}

contract ContractA2 {
    receive() {
        let sB = initOf ContractB2();
        let _ = sB.data;
    }
}
