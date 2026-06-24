//// Comprehensive Fuzz-Testing for initOf and Cross-Contract Relationships

// Test 1: Simple cross-contract initialization
contract B1 {
    init() {}
}

contract A1 {
    init() {
        let pkg = initOf B1();
        let addr = contractAddress(pkg);
    }
}

// Test 2: Multi-level/hierarchical initialization
contract C2 {
    init() {}
}

contract B2 {
    init() {
        let pkg = initOf C2();
    }
}

contract A2 {
    init() {
        let pkg = initOf B2();
    }
}

// Test 3: Cyclic (recursive) initialization between two contracts
contract A3 {
    init() {
        let pkg = initOf B3();
    }
}

contract B3 {
    init() {
        let pkg = initOf A3();
    }
}

// Test 4: Complex graph with multiple dependencies
contract D4 {
    init() {}
}

contract B4 {
    init() {
        let pkg = initOf D4();
    }
}

contract C4 {
    init() {
        let pkg = initOf D4();
    }
}

contract A4 {
    init() {
        let pkg1 = initOf B4();
        let pkg2 = initOf C4();
    }
}

// Test 5: Using contracts with parameters along with initOf
contract ParamEx5(x: Int, y: Int) {}

contract TestParam5 {
    init() {
        let pkg = initOf ParamEx5(10, 20);
    }
}

// Test 6: Self-referential initOf
contract SelfRef6 {
    init() {
        // Self-reference using initOf on the same contract
        let pkg = initOf SelfRef6();
        let addr = contractAddress(pkg);
    }
}
