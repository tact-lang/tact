/// Test 2: Multi-level hierarchical parent-child relationship
contract Leaf {
    init(v: Int) {
        // Leaf initialization logic
    }
}

contract Middle {
    init(v: Int) {
        // Middle uses initOf of Leaf with adjusted parameter
        let _ = initOf Leaf(v + 1);
    }
}

contract Root {
    init(v: Int) {
        // Root uses initOf of Middle with adjusted parameter
        let _ = initOf Middle(v * 2);
    }
}

// Entry point for deployment / testing
contract EntryPoint {
    init() {
        // Instantiate Root with a sample value
        let _ = initOf Root(10);
    }
}
