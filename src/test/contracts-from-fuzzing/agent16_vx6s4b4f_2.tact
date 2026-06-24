contract Grandparent {
    receive() {
        // Multi-level: Grandparent initializes Parent
        let s = initOf Parent();
    }
}

contract Parent {
    init() {}
    receive() {
        // Multi-level: Parent initializes Child
        let s = initOf Child();
    }
}

contract Child {
    init() {}
    receive() {
        // Basic receive function
    }
}

contract SelfRef {
    init() {}
    receive() {
        // Recursive initialization: SelfRef initializes itself
        let s = initOf SelfRef();
    }
}

contract CrossCycleA {
    receive() {
        // Cross-contract cyclic dependency: A -> B
        let s = initOf CrossCycleB();
    }
}

contract CrossCycleB {
    receive() {
        // Cross-contract cyclic dependency: B -> A
        let s = initOf CrossCycleA();
    }
}

contract Param {
    // Contract with parameters
    init(x: Int) {
        // Using parameter x in initialization; no state modification needed
    }
    receive() {
        // Initialize with parameter and a trailing comma
        let s = initOf Param(123,);
    }
}

contract F {
    receive() {
        // Use initOf in an expression to compute self-address
        let addr = contractAddress(initOf F());
    }
}
