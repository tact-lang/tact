contract Child {
    init(x: Int) {}
    receive() {}
}

contract GrandChild {
    init(y: Int) {}
    receive() {}
}

contract Parent {
    init(a: Int, b: Int) {
        // Nested initialization for cross-contract relations
        let childInit: StateInit = initOf Child(a);
        let gcInit: StateInit = initOf GrandChild(b);
    }

    // Expose helper functions to get initial state packages
    fun getChildInit(a: Int): StateInit { 
        return initOf Child(a);
    }
    fun getGrandChildInit(b: Int): StateInit {
        return initOf GrandChild(b);
    }
    receive() {}
}

contract Complex {
    // Combines multi-level contract graph dependencies.
    // Invokes initOf on Parent that itself uses initOf on Child and GrandChild
    fun getParentInit(a: Int, b: Int): StateInit {
        return initOf Parent(a, b,);
    }
    receive() {}
}
