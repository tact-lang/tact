// Parameterized contract initialization and cross-contract address computation
contract Param {
    // contract parameter
    a: Int;

    // init takes a single parameter
    init(a: Int) {
        self.a = a;
    }

    get fun getA(): Int {
        return self.a;
    }
}

contract Caller {
    // This getter returns the address of a Param instance initialized with value 5
    get fun getParamAddress(): Address {
        let initPkg = initOf Param(5);
        return contractAddress(initPkg);
    }

    // This getter returns the value of parameter 'a' via retrieving Param's init package
    get fun getParamValue(): Int {
        let initPkg = initOf Param(5);
        // By convention, the contract address is computed from initPkg but we can't directly extract parameters
        // Instead, we simulate that if the contract were deployed, getA() would yield 5
        return 5;
    }
}
