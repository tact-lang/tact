contract Simple {
    init() {}
    receive() {
        let addr1 = myAddress();
        let addr2 = contractAddress(initOf Simple());
        require(addr1 == addr2, "error");
    }
}

// Test 2: Mutual dependency between contracts A and B
contract A {
    init() {}
    receive() {
        let addrB = contractAddress(initOf B());
        // A and B are distinct, so addresses must differ
        require(addrB != myAddress(), "error");
    }
}

contract B {
    init() {}
    receive() {
        let addrA = contractAddress(initOf A());
        require(addrA != myAddress(), "error");
    }
}

// Test 3: Parent-Child hierarchical relation
contract Child {
    init() {}
}

contract Parent {
    child_state: StateInit;
    init() {
        self.child_state = initOf Child();
    }
    receive() {
        let child_addr = contractAddress(self.child_state);
        require(child_addr != myAddress(), "error");
    }
}

// Test 4: Nested contract graph: Leaf, Middle, Root
contract Leaf {
    init() {}
}

contract Middle {
    leaf_state: StateInit;
    init() {
        self.leaf_state = initOf Leaf();
    }
}

contract Root {
    middle_state: StateInit;
    init() {
        self.middle_state = initOf Middle();
    }
    receive() {
        let middle_addr = contractAddress(self.middle_state);
        let leaf_addr = contractAddress(initOf Leaf());
        // They should be different because Middle and Leaf are distinct
        require(middle_addr != leaf_addr, "error");
    }
}

// Test 5: Self-recursive initialization
contract SelfRecursive {
    init() {}
    receive() {
        let self_state = initOf SelfRecursive();
        let addr = contractAddress(self_state);
        require(addr == myAddress(), "error");
    }
}

// Test 6: Contract with parameters, using contract parameters syntax (no explicit init required)
contract ArgsContract(x: Int) {}

contract TestArgs {
    init() {}
    receive() {
        let state = initOf ArgsContract(42);
        let addr = contractAddress(state);
        require(addr != myAddress(), "error");
    }
}

// Test 7: Repeated initialization consistency
contract Repeated {
    init() {}
    receive() {
        let state1 = initOf Repeated();
        let addr1 = contractAddress(state1);
        let state2 = initOf Repeated();
        let addr2 = contractAddress(state2);
        require(addr1 == addr2, "error");
    }
}
