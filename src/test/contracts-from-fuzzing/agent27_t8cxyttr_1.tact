contract SimpleA {
    init() {}
}

contract SimpleB {
    // Tests simple cross-contract initialization using initOf
    fun testSimple() : Bool {
        let s1 = initOf SimpleA();
        let addr1 = contractAddress(s1);
        let s2 = initOf SimpleA();
        let addr2 = contractAddress(s2);
        return addr1 == addr2;
    }
}

contract AParam {
    // Contract with a parameter in its constructor
    init(x: Int) {}
}

contract BParam {
    // Tests passing arguments to a contract's constructor via initOf
    fun testParam() : Bool {
        let s = initOf AParam(42);
        let addr = contractAddress(s);
        // Dummy check: an address computed from a valid init package should not be equal to the base null address
        return addr != address("0:0000000000000000000000000000000000000000000000000000000000000000");
    }
}

contract SelfRef {
    // Contract that uses initOf on itself
    init() {}
    get fun selfCode() : Cell {
        return (initOf SelfRef()).code;
    }
}

contract NestedChain {
    // A basic contract intended to be used in nested initOf calls
    init() {}
}

contract NestedCaller {
    // Tests a multi-level initialization: retrieving initOf of another contract
    fun testNested() : Bool {
       let s = initOf NestedChain();
       let addr = contractAddress(s);
       // Dummy check: address should be defined and not be equal to the caller's address
       return addr != myAddress();
    }
}
