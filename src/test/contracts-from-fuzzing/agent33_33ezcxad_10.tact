// Fuzz testing of initOf functionality and cross-contract relationships

// 1. Simple cross-contract initialization: using initOf to compute the state and then get the contract address of the same contract

contract SimpleInit {
    receive() {
        let initState = initOf SimpleInit();
        let addr1 = myAddress();
        let addr2 = contractAddress(initState);
        // According to docs: myAddress() and contractAddress(initOf ThisContract) should be equal
    }
}

// 2. Parent-child relationship: Parent contract initializing a Child contract

contract Child {
    value: Int;
    init(v: Int) { self.value = v; }
    get fun getValue(): Int { return self.value; }
}

contract Parent {
    dummy: Int;
    init() {
        let childInit = initOf Child(123);
        let childAddr = contractAddress(childInit);
        // Using childInit and its computed address; no further operations needed
        self.dummy = 123;
    }
    get fun getChildValue(): Int { return self.dummy; }
}

// 3. Recursive initialization: A contract uses initOf on itself

contract Recursive {
    x: Int;
    init() {
        let selfInit = initOf Recursive();
        let addr_from_init = contractAddress(selfInit);
        let curr_addr = myAddress();
        // Although logically ambiguous, compiler allows a contract to use initOf on itself
        self.x = 42;
    }
    get fun getX(): Int { return self.x; }
}

// 4. Multi-level nested contracts: Level1 -> Level2 -> Level3

contract Level3 {
    v: Int;
    init(v_: Int) { self.v = v_; }
    get fun getV(): Int { return self.v; }
}

contract Level2 {
    childAddr: Address;
    init() {
        let init3 = initOf Level3(300);
        self.childAddr = contractAddress(init3);
    }
}

contract Level1 {
    addr: Address;
    init() {
        let init2 = initOf Level2();
        self.addr = contractAddress(init2);
    }
    get fun getAddr(): Address { return self.addr; }
}

// 5. Cyclic dependency between two contracts: A calls initOf B and B calls initOf A.

contract A {
    init() {
        let b_init = initOf B();
        let addrB = contractAddress(b_init);
    }
}

contract B {
    init() {
        let a_init = initOf A();
        let addrA = contractAddress(a_init);
    }
}

// 6. Edge case with trailing commas and expressions

contract C {
    a: Int;
    init(a_: Int) { self.a = a_; }
    get fun getA(): Int { return self.a; }
}

contract D {
    a: Int;
    cAddr: Address;
    init(a_: Int) {
        self.a = a_;
        let cInit = initOf C(a_ + 10,); // trailing comma allowed
        self.cAddr = contractAddress(cInit);
    }
    get fun getA(): Int { return self.a; }
}

// 7. Multiple cross-contract initializations in a single contract

contract F {
    v: Int;
    init(v: Int) { self.v = v; }
    get fun getV(): Int { return self.v; }
}

contract G {
    v: Int;
    init(v: Int) { self.v = v; }
    get fun getV(): Int { return self.v; }
}

contract E {
    fAddr: Address;
    gAddr: Address;
    init() {
        let fInit = initOf F(10);
        let gInit = initOf G(20);
        self.fAddr = contractAddress(fInit);
        self.gAddr = contractAddress(gInit);
    }
    get fun getFAddress(): Address { return self.fAddr; }
    get fun getGAddress(): Address { return self.gAddr; }
}

// 8. Repeated initialization tests: calling initOf twice on the same contract

contract DoubleSelf {
    dummy: Int;
    init() {
        let initA = initOf DoubleSelf();
        let addrA = contractAddress(initA);
        let initB = initOf DoubleSelf();
        let addrB = contractAddress(initB);
        // If initOf is pure at compile time, addrA and addrB should consistently be computed.
        self.dummy = 1;
    }
    get fun getDummy(): Int { return self.dummy; }
}
