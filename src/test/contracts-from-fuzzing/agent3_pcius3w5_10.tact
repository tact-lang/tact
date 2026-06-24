/* Snippet 10: Complex nested contract graph
   Two independent leaves (Leaf1, Leaf2) are initialized in a Branch contract,
   and then a RootComplex contract initializes Branch and also calls initOf on Leaf1 recursively.
*/

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
