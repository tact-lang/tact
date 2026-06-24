contract Grandchild {
    init(val: Int) {
        // Minimal init
    }
}

contract Child {
    init(val: Int) {
        // Call initOf on Grandchild with a computed parameter
        let grand = initOf Grandchild(val + 1);
    }
}

contract Parent {
    init() {
        // Multi-level: Parent -> Child -> Grandchild
        let childState = initOf Child(10);
        let addr = contractAddress(childState);
    }
}
