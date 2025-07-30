/// Test 8: Mixed scenario with multiple initOf calls and expression evaluation

contract SubContract {
    init(v: Int) {
        // Basic initialization, simply storing the value (not persisted)
    }
}

contract Intermediate {
    init(x: Int, y: Int) {
        // Calls initOf on SubContract twice, with different parameters
        let s1: StateInit = initOf SubContract(x);
        let s2: StateInit = initOf SubContract(y);
        // Combine code snippets (for testing only, not meaningful in production)
        return; // no return value as init is void
    }
}

contract MainContract {
    init(a: Int, b: Int, flag: Bool) {
        // Depending on flag, use different init chains
        if (flag) {
            let _ = initOf Intermediate(a, b);
        } else {
            // Directly initialize SubContract
            let _ = initOf SubContract(a + b);
        }
    }
}

contract EntryPoint {
    init() {
        // Execute MainContract initialization with branching
        let _ = initOf MainContract(3, 7, true);
        let _ = initOf MainContract(5, 2, false);
    }
}
