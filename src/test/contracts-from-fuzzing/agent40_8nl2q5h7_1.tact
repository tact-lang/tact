contract Child {
    init() {}
}

contract Parent {
    // a getter that returns the computed address of Child, computed via initOf
    get fun getChildAddress(): Address {
        return contractAddress(initOf Child());
    }
}

// Dummy receive function to allow deployment if needed
contract Dummy {
    receive() {}
}
