// Test 8: Circular dependency between contracts A, B, and C using initOf

contract A {
    init() {
        // In the constructor, refer to B's initial state
        let stateB = initOf B();
    }
    receive() {
        // In receive, compute address of B's init, and ensure it's not equal to my address
        let addrB = contractAddress(initOf B());
        require(addrB != myAddress(), "error");
    }
}

contract B {
    init() {
        // Referencing C's initial state
        let stateC = initOf C();
    }
    receive() {
        let addrC = contractAddress(initOf C());
        require(addrC != myAddress(), "error");
    }
}

contract C {
    init() {
        // Circularly referencing A's initial state
        let stateA = initOf A();
    }
    receive() {
        let addrA = contractAddress(initOf A());
        require(addrA == contractAddress(initOf A()), "error");
    }
}
