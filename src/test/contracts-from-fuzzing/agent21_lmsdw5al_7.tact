// The following code combines several edge-case tests for initOf and cross-contract relationships

// Test 1: Simple cross-contract initialization scenario
contract SimpleChild {
    init() {}
    receive() {}
}

contract SimpleParent {
    receive() {
        // Using initOf for SimpleChild
        let s = initOf SimpleChild();
        let addr = contractAddress(s);
    }
}

// Test 2: Multi-level parent-child relationships
contract GrandChild {
    init() {}
    receive() {}
}

contract Child {
    init() {}
    receive() {
         let s = initOf GrandChild();
         let addr = contractAddress(s);
    }
}

contract Parent {
    receive() {
         let s = initOf Child();
         let addr = contractAddress(s);
    }
}

// Test 3: Recursive initialization: a contract using initOf on itself
contract Recursive {
    receive() {
         let s = initOf Recursive();
         let addr = contractAddress(s);
    }
    init() {}
}

// Test 4: Mutual recursive initialization between two contracts
contract A {
    receive() {
         let s = initOf B();
         let addr = contractAddress(s);
    }
    init() {}
}

contract B {
    receive() {
         let s = initOf A();
         let addr = contractAddress(s);
    }
    init() {}
}

// Test 5: Deep nested contract graph with multiple levels
contract Level4 {
    init() {}
    receive() {}
}

contract Level3 {
    init() {}
    receive() {
         let s = initOf Level4();
         let addr = contractAddress(s);
    }
}

contract Level2 {
    init() {}
    receive() {
         let s = initOf Level3();
         let addr = contractAddress(s);
    }
}

contract Level1 {
    init() {}
    receive() {
         let s = initOf Level2();
         let addr = contractAddress(s);
    }
}

contract Level0 {
    init() {}
    receive() {
         let s = initOf Level1();
         let addr = contractAddress(s);
    }
}

// Test 6: Cross-contract initialization with parameterized contract
contract ParamContract(foo: Int) {
    receive() {
         let s = initOf ParamContract(42);
         let addr = contractAddress(s);
    }
}

contract TestParam {
    init() {}
    receive() {
         let s = initOf ParamContract(100);
         let addr = contractAddress(s);
    }
}
