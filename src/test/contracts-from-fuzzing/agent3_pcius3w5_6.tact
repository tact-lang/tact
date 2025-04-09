/* Snippet 6: Diamond dependency graph
   Two sibling contracts (Left, Right) both depend on a common contract (C),
   and their parent (Diamond) initializes both. */

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
