contract Child {
    init() {
        // simple init
    }
}

contract Parent {
    receive() {
        // simple cross-contract usage of initOf
        let childInit = initOf Child();
        // use childInit to compute address
        let addr = contractAddress(childInit);
    }
}
