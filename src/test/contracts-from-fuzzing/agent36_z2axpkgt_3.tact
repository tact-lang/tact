contract Recursive {
    init(x: Int) {
        // Recursive initOf usage: this computes the initial state of Recursive with a modified parameter.
        let state = initOf Recursive(x + 1);
    }

    receive() {}
}

// Additionally, a complex contract graph with multi-level initOf usage:

contract Grandchild {
    init(value: Int) {
        // Perform a simple arithmetic operation
        let _ = value + 10;
    }
}

contract Child {
    init(num: Int) {
        // Initialize Grandchild with a transformation of num
        let gcState = initOf Grandchild(num * 2);
    }
}

contract Parent {
    init(base: Int) {
        // Initialize Child and Recursive contracts in a nested manner
        let childState = initOf Child(base + 5);
        let recState = initOf Recursive(base - 3);
    }

    receive() {}
}
