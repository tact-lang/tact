contract GrandChild {
    init() {
        // GrandChild initialization
    }
}

contract Child {
    init() {
        // Child initialization
        let gcInit = initOf GrandChild();
    }
}

contract Parent {
    receive() {
        // Parent receive uses initOf Child
        let childInit = initOf Child();
        let addr = contractAddress(childInit);
    }
}

contract GrandParent {
    receive() {
        // GrandParent receive uses initOf Parent
        let parentInit = initOf Parent();
        let addr = contractAddress(parentInit);
    }
}
