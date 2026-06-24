/* Snippet 3: Multi-level hierarchical contract initialization
   This snippet tests a chain: Root -> Middle -> Leaf where each contract's init uses initOf of its child contract. */

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
