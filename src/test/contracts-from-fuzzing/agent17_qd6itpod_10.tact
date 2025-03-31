// Comprehensive Fuzz-Testing of initOf and Cross-Contract Relationships
// This testing cycle covers a series of code snippets targeting various aspects of the initOf functionality:
// 1. Simple cross-contract initialization.
// 2. Multi-level parent-child relationships.
// 3. Recursive initialization (mutual recursion) between two contracts.
// 4. Self-recursive initialization.
// 5. Complex nested contract graphs (cycle across three contracts).
// 6. Use of contract parameters vs. initOf for initialization state derivation.
// 7. Comparison of addresses from initOf computed StateInit with runtime myAddress().
// 8. Nested initialization: Outer -> Inner -> Nested.

// Test 1: Simple cross-contract initialization
contract A {
    init() {}
    receive() {}
}

contract B {
    // Return initial state of contract A
    fun getAInit() : StateInit {
        return initOf A();
    }
    receive() {}
}

// Test 2: Multi-level initialization
contract C {
    // Return initial state of contract B
    fun getBInit() : StateInit {
        return initOf B();
    }
    receive() {}
}

// Test 3: Mutual recursion between two contracts
contract X {
    fun getYInit() : StateInit {
        return initOf Y();
    }
    receive() {}
}

contract Y {
    fun getXInit() : StateInit {
        return initOf X();
    }
    receive() {}
}

// Test 4: Self-recursive initialization (contract calling its own initOf)
contract SelfRec {
    fun selfInit() : StateInit {
        return initOf SelfRec();
    }
    receive() {}
}

// Test 5: Cycle over three contracts
contract D {
    fun getEInit() : StateInit {
        return initOf E();
    }
    receive() {}
}

contract E {
    fun getFInit() : StateInit {
        return initOf F();
    }
    receive() {}
}

contract F {
    fun getDInit() : StateInit {
        return initOf D();
    }
    receive() {}
}

// Test 6: Use of contract parameters (no init() allowed)
// Contract G uses contract parameter syntax to define its state
contract G(x: Int) {
    // 'x' is the persistent state variable injected at the time of deployment
    receive() {}
}

contract H {
    // Returns initial state of contract G with x = 123
    fun getGInit() : StateInit {
        return initOf G(123);
    }
    receive() {}
}

// Test 7: Comparing derived contract addresses
contract Runner {
    receive() {
        let myAddr: Address = myAddress();
        let state: StateInit = initOf Runner();
        let computed: Address = contractAddress(state);
        // For workchain 0, these addresses should be identical
        dump(myAddr);
        dump(computed);
    }
}

// Test 8: Nested initialization relationships
contract Nested {
    receive() {}
}

contract Inner {
    fun getNestedInit() : StateInit {
        return initOf Nested();
    }
    receive() {}
}

contract Outer {
    fun getInnerInit() : StateInit {
        return initOf Inner();
    }
    receive() {
        let init1: StateInit = initOf Inner();
        let addr1: Address = contractAddress(init1);
        let addr2: Address = contractAddressExt(0, init1.code, init1.data);
        dump(addr1);
        dump(addr2);
    }
}
