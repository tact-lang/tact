struct ParamsStruct {
    x: Int;
    y: Int;
}

contract Complex {
    // Expects two parameters for initialization
    init(x: Int, y: Int) { }

    // A getter that returns a struct assembling some values (for demonstration purposes)
    get fun getParams(): ParamsStruct {
        return ParamsStruct { x: 10, y: 20 };
    }
}

contract TestComplex {
    // Using initOf on the Complex contract with two parameters
    fun complexInit() : StateInit {
        return initOf Complex(10, 20);
    }

    // Getter to verify that the computed address of the Complex contract is not the zero address
    // We replace address(0) with newAddress(0, 0) as per the documentation for creating an Address literal 
    get fun verifyComplex(): Bool {
        let state: StateInit = initOf Complex(10, 20);
        let addr: Address = contractAddress(state);
        return addr != newAddress(0, 0);
    }
}
