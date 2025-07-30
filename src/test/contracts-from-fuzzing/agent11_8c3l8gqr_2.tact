contract Child {
    init() {}
}

contract Parent {
    receive() {
        let childInit = initOf Child();
        let childAddr = contractAddress(childInit);
    }
}
