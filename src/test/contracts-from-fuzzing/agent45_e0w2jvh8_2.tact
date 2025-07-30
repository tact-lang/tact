contract SubChild {
    init(y: Int) {
        // Simple initialization with parameter y
    }
}

contract Child {
    init(x: Int) {
        // Initialize SubChild with x+1
        let s = initOf SubChild(x + 1);
        let addr = contractAddress(s);
    }
}

contract Parent {
    receive() {
        // Initialize Child with 42
        let s = initOf Child(42);
        let addr = contractAddress(s);
    }
}
